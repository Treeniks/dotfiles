# Firefox

Based primarily on [Minimal-Arc](https://github.com/zayihu/Minimal-Arc) with a few changes:
- no hardcoded colors, to be used in conjunction with [Adaptive Tab Bar Color](https://addons.mozilla.org/en-US/firefox/addon/adaptive-tab-bar-colour/)
- static sidebar, i.e. no expanding on hover and just a static (although resizable) width instead

## Manual Install

- install [Sidebery](https://addons.mozilla.org/en-US/firefox/addon/sidebery/)
- enable `toolkit.legacyUserProfileCustomizations.stylesheets` in about:config or install [Betterfox](https://github.com/yokoffing/Betterfox) configs
- copy `chrome` folder into Firefox profile (about:profiles)
- import `sidebery-data.json` in Sidebery settings

## Link Script

`link.py` will create a symlink for the `chrome` folder. The script has certain assumptions about the location of the correct profile folder. It's the locations I personally use on my machines. E.g., on Windows, it assumes Firefox is installed via scoop and uses the scoop profile.

The script also optionally installs Betterfox.
