# Oh-My-Zsh Setup

## 1. Install zsh
```
sudo apt-get install zsh
```
## 2. Install Oh-My-Zsh (a tool for managing configurations of zsh)
```
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
## 3. Install Oh-My-Zsh Plugins
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
## 4. Set zsh as default shell (require log out)
```
sudo chsh -s /bin/zsh <username>
```
verify (replace nvim with your editor if not nvim): ```sudo nvim /etc/passwd```

(use /<username> to search)
## 5. Download Theme
(https://github.com/romkatv/powerlevel10k#oh-my-zsh)
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
## 6. Update .zshrc file
(replace nvim with your editor if not nvim)
```
nvim ~/.zshrc
```
.zshrc file:
```
...
ZSH_THEME="powerlevel10k/powerlevel10k"
...
plugins=
(
git
zsh-autosuggestions
zsh-syntax-highlighting
)
...
```
list all pre-installed themes: 
``` ls ~/.oh-my-zsh/themes```