# NVim Setup
## 0. File Structure 
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

## 1. Gradle
   - [Optional] Run the following to clean up previously installed Gradle
     ```
     sudo rm -rf /opt/gradle/*
     ```
   - Download (e.g. gradle-8.11): https://gradle.org/releases/
   - Install the package:
     ```
     cd ~/Downloads
     sudo unzip -d /opt/gradle gradle-8.11-all.zip
     ls -lhtr /opt/gradle/gradle-8.11
     ```
   - Add the following to ~/.bashrc or ~/.zshrc
     ```
     export PATH=$PATH:/opt/gradle/gradle-8.11/bin
     ```
## 2. Java
   - [Optional] Run the following to clean up previously installed JDK
     ```
     dpkg-query -W -f='${binary:Package}\n' | grep -E -e '^(ia32-)?(sun|oracle)-java' -e '^openjdk-' -e '^icedtea' -e '^(default|gcj)-j(re|dk)' -e '^gcj-(.*)-j(re|dk)' -e '^java-common' | xargs sudo apt-get -y remove
     sudo apt-get -y autoremove
     sudo bash -c 'ls -d /home/*/.java' | xargs sudo rm -rf
     sudo rm -rf /usr/lib/jvm/*
     ```
   - Download latest JDK (e.g. jdk-23.0.1): https://jdk.java.net/23/
     ```
     cd ~/Downloads
     sudo mkdir -p /usr/lib/jvm
     sudo tar -C /usr/lib/jvm -xvf openjdk-23.0.1_linux-x64_bin.tar.gz
     sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-23.0.1/bin/java" 1
     sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-23.0.1/bin/javac" 1
     ls -lhtr /usr/lib/jvm
     ```
   - Add the following to ~/.bashrc or ~/.zshrc
     ```
     export JAVA_HOME=/usr/lib/jvm/jdk-23.0.1
     ```

## 3. Install NVIM 
   - Download latest NVIM: https://github.com/neovim/neovim/blob/master/INSTALL.md
     ```
     cd ~/Downloads
     sudo tar -C /opt -zvxf nvim-linux64.tar.gz
     ```
   - Add the following to ~/.bashrc or ~/.zshrc
     ```
     export PATH=$PATH:/opt/nvim-linux64/bin
     ```
   - Setup NVIM (options, plugins, etc.)
     ```
     git clone https://github.com/victorlamprojects/Settings.git
     cp -r ./Settings/Linux\ Setup/nvim/nvim ~/.config  
     ```

