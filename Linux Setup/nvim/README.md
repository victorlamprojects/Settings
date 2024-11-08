# NVim Setup
## File Structure (https://learnvimscriptthehardway.stevelosh.com/chapters/42.html)
```
$HOME/.config
└───nvim
    └───init.lua        	# Root configuration using lua
    └───lua   				# lua setup
        └───config      	# lazyvim config
		│   ├── jdtls.lua 	# jdtls config
        │   ├── options.lua	# vim configs
		│   └── keymaps.lua	# Key mappings
        └───plugins     	# Plugins
```

## 0. Install NVIM 
(https://github.com/neovim/neovim/blob/master/INSTALL.md)
```
cd ~/Downloads
sudo tar -C /opt -zvxf nvim-linux64.tar.gz
```
Add the following to ~/.bashrc or ~/.zshrc
```
export PATH=$PATH:/opt/nvim-linux64/bin
```
Setup NVIM (options, plugins, etc.)
```
git clone https://github.com/victorlamprojects/Settings.git
cp -r ./Settings/Linux\ Setup/nvim/nvim ~/.config  
```

## 1. Gradle
(https://gradle.org/releases/)
```
sudo mkdir /opt/gradle
cd ~/Downloads
sudo unzip -d /opt/gradle gradle-8.10.2-all.zip
ls -lhtr /opt/gradle/gradle-8.10.2
```

## 2. Java
(https://jdk.java.net/23/)
```
cd ~/Downloads
sudo tar -C /usr/lib/jvm/jdk-23.0.1 -xvf openjdk-23.0.1_linux-x64_bin.tar.gz
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-23.0.1/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-23.0.1/bin/javac" 1
```
Add the following to ~/.bashrc or ~/.zshrc
```
export JAVA_HOME=/usr/lib/jvm/jdk-23.0.1
export PATH=$PATH:/opt/gradle-8.10.2/bin
```
