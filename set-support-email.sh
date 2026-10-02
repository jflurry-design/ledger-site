#!/bin/sh
# Replace the support-email placeholder on the Privacy and Support pages with a real address.
# Usage: ./set-support-email.sh help@example.com
set -eu
EMAIL="${1:-}"
case "$EMAIL" in
  *@*.*) ;;
  *) echo "usage: $0 you@example.com" >&2; exit 1 ;;
esac
cd "$(dirname "$0")"
for f in privacy/index.html support/index.html; do
  EMAIL="$EMAIL" perl -0pi -e '
    s{<span class="email-placeholder" data-support-email>[^<]*</span>}{<a href="mailto:$ENV{EMAIL}" data-support-email>$ENV{EMAIL}</a>}g;
    s{<a href="mailto:[^"]*" data-support-email>[^<]*</a>}{<a href="mailto:$ENV{EMAIL}" data-support-email>$ENV{EMAIL}</a>}g;
    s{<!-- SUPPORT_EMAIL:[^>]*-->}{<!-- SUPPORT_EMAIL: set by set-support-email.sh -->}g;
  ' "$f"
  echo "updated $f"
done
grep -n 'data-support-email' privacy/index.html support/index.html
echo "Now: git commit -am 'Set support email' && git push"
