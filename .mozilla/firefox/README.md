# 🦊 Firefox Theming Setup Guide

### Textfox
If you want minimal firefox minimal look Go For **[Textfox](https://github.com/adriankarlen/textfox)** first it is completely optional but make sure you do not install textfox after pywalfox initialisation

## Pywalfox
First Install [Pywalfox](https://github.com/Frewacom/pywalfox) (Very Important)


## Setup
- First copy your profile folder name it will be in `.mozilla/firefox` and named as xyz.default-release, after copying it change the profile path in `.config/matugen/config.toml` at line `63`

- Create a folder named `websites` in `xyz.default-release/chrome/`

- Copy all the files from [websites](/.mozilla/firefox/chrome/websites/) and paste it in `xyz.default-release/chrome/websites`

- Create files named `colors.css` and `userContent.css` in `xyz.default-release/chrome/`

- Add these two lines in start of `userContent.css`
```css
@import url("colors.css");
@import url("websites/index.css");
```

- Open firefox then go to `about:config` and search `toolkit.legacyUserProfileCustomizations.stylesheet` and set it to `true`