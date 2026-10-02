# ledger-site

Static privacy, terms and support pages for **Kitchen Table Finance** (iPhone app, bundle `com.jasonflurry.ledger`), published with GitHub Pages.

Live site: https://jflurry-design.github.io/ledger-site/

| Page | URL | Used for |
|---|---|---|
| Home | https://jflurry-design.github.io/ledger-site/ | App Store Connect → Marketing URL (optional) |
| Privacy Policy | https://jflurry-design.github.io/ledger-site/privacy/ | App Store Connect → Privacy Policy URL; `AppBrand.privacyURL` |
| Terms of Use | https://jflurry-design.github.io/ledger-site/terms/ | Optional custom terms page (the app's `AppBrand.termsURL` points at Apple's Standard EULA) |
| Support | https://jflurry-design.github.io/ledger-site/support/ | App Store Connect → Support URL; `AppBrand.supportURL` |

The repo name is deliberately neutral (`ledger-site`) so an app rename doesn't break URLs registered in App Store Connect.

## Support email (placeholder — replace before launch)

The support address isn't decided yet. It appears **only** on two pages, as a highlighted placeholder
`support@ (coming soon)` inside `<span class="email-placeholder" data-support-email>`, each marked with a `<!-- SUPPORT_EMAIL -->` comment:

- `support/index.html` (Contact us card)
- `privacy/index.html` (Contact section)

**Replace both in one step:**

```sh
./set-support-email.sh help@example.com   # turns both placeholders into mailto: links
git commit -am "Set support email" && git push
```

Run it again later to change the address. Use a dedicated mailbox or an iCloud Hide My Email alias, never a personal address.

## Structure

Plain HTML + CSS, no build step, no JavaScript, no cookies, no analytics, no third-party requests.

```
index.html            landing page
privacy/index.html    privacy policy
terms/index.html      terms of use (subscription terms + link to Apple's Standard EULA)
support/index.html    support + FAQ
assets/site.css       Soft Daylight (light) / Night Drive (dark) tokens from brand/palette.json
assets/icon.svg       placeholder mark (swap for the real app icon when final)
assets/fonts/         Figtree + Inter variable fonts (SIL OFL 1.1, licenses included)
.nojekyll             serve files as-is (no Jekyll processing)
```

Light/dark follows the visitor's system setting (`prefers-color-scheme`). SF Pro isn't used on the web (Apple's font license doesn't allow it); Figtree/Inter are the brand's open-licensed web fonts.

## Editing

- Update the **"Last updated"** date on Privacy/Terms whenever their text changes.
- Prices, trial length and feature names must match App Store Connect and the app. No outcome claims ("save $X", "fix your finances", "guaranteed").
- Pages deploy automatically from `main` (root) a minute or so after each push.
