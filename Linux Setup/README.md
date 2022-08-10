# Linux Setup

## Table of Contents  
1. [GNOME Theme](#theme)
2. [Editor (Vim / NVim)](#editor)
3. [Git](#git)
4. [Packages](#packages)

## 1. GNOME Theme <a name="editor"></a>
- follow [GNOME Theme Setup](./gnome/README.md)
## 2. Editor (Vim / Nvim) <a name="editor"></a>
### NVim (recommended)
- nvim is more recommended as it has higher extensibility and usability
- follow [NVIM Setup](./nvim/README.md)
### Vim
- follow [VIM Setup](./nvim/README.md)

## 3. Git/Github <a name="git"></a>
### 1. Install Git
```
sudo apt-get install git
```
### 2. Configure git
(replace nvim with vim if you want to use vim)
```
git config --global user.name=[name]
git config --global user.email=[email]
git config --global core.editor "nvim"
```
### 3. Get a personal access token from github
(Settings->Developer settings->Personal access tokens->Generate new tokens)
### 4. You can use the PAT as the password or update the remote url
(a better approach is to use GCM)
```
git remote set-url origin https://[PAT-TOKEN]@github.com/[USERNAME]/[REPO-NAME].git/
```
## 4. Packages <a name="packages"></a>
### 1. Update npm
```
sudo npm install npm -g
```
### 2. Install Yarn
```
sudo npm install --global yarn
```
