# Linux Setup

## Table of Contents  
1. [Packages](#packages)
2. [GNOME Theme](#theme)
3. [Editor (Vim / NVim)](#editor)
4. [Git](#git)
5. [Oh-My-Zsh](#oh-my-zsh)
6. [Keychron Keyboard](#keychron)
7. [Chrome Extension - Remove Youtube Ads(Optional)](#ext-remove-youtube-ads)

## 1. Packages <a name="packages"></a>
### 0. Install packages
```
sudo apt-get install curl
sudo apt-get install git
```
### 1. Update npm
```
sudo apt-get install npm
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo n latest
```
### 2. Install Yarn
```
sudo npm install --global yarn
```

## 2. GNOME Theme <a name="theme"></a>
- follow [GNOME Theme Setup](./gnome/README.md)

## 3. Editor (Vim / Nvim) <a name="editor"></a>
### NVim (recommended)
- nvim is more recommended as it has higher extensibility and usability
- follow [NVIM Setup](./nvim/README.md)
### Vim
- follow [VIM Setup](./nvim/README.md)

## 4. Git/Github <a name="git"></a>
### 1. Configure git
(replace nvim with vim if you want to use vim)
```
git config --global user.name=[name]
git config --global user.email=[email]
git config --global core.editor "nvim"
```
### 2. Get a personal access token from github
(Settings->Developer settings->Personal access tokens->Generate new tokens)
### 3. You can use the PAT as the password or update the remote url
(a better approach is to use GCM)
```
git remote set-url origin https://[PAT-TOKEN]@github.com/[USERNAME]/[REPO-NAME].git/
```

## 5. Oh-My-Zsh <a name="oh-my-zsh"></a>
- follow [Oh-My-Zsh Setup](./oh-my-zsh/README.md)

## 6. Keychron Keyboard <a name="keychron"></a>
### On Linux, the Keychron keyboards don't register any of the F1-F12 function keys as actual F keys, instead, treating them as multimedia keys by default.
(https://mikeshade.com/posts/keychron-linux-function-keys/)
### To fix this, run
```
echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
```

## 7. Chrome Extension - Remove Youtube Ads(Optional) <a name="ext-remove-youtube-ads"></a>
### 1. Add `Tampermonkey` Extension
(https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo?hl=en)
### 2. Click `Tampermonkey` extension
### 3. Click `Create a new script...`
### 4. Put the following content into the script
```
// ==UserScript==
// @name         Remove Youtube Ads
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Remove Youtube Ads
// @author       You
// @match        https://www.youtube.com/*
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @grant        none
// ==/UserScript==

(() => {
    const defined = v => v !== null && v !== undefined;
    const timeout = setInterval(() => {
        const btn = document.querySelector('.videoAdUiSkipButton,.ytp-ad-skip-button');
        if (btn) {
            btn.click();
        }
        const popUpAddBtn = document.querySelector('.ytp-ad-overlay-close-button');
        if (popUpAddBtn) {
            popUpAddBtn.click();
        }
        const ad = [...document.querySelectorAll('.ad-showing')][0];
        if (defined(ad)) {
            const video = document.querySelector('video');
            if (defined(video)) {
                video.currentTime = video.duration;
            }
        }
    }, 500);
    return function() {
        clearTimeout(timeout);
    }
})();
```
### 5. Save and re-open the Chrome browser
