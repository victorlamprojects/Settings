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
## 1. Java Build Automation Tool 
### 1. Gradle
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
### 2. Maven
   - Download (e.g. apache-maven-3.9.9-bin.tar.gz): https://maven.apache.org/download.cgi
   - Install the package:
     ```
     cd ~/Downloads
     sudo tar -C /opt -xvf apache-maven-3.9.9-bin
     sudo ln -s /opt/apache-maven-3.9.9 /opt/maven
     ls -lhtr /opt/maven
     ```
   - Add the following to ~/.bashrc or ~/.zshrc
     ```
     export M2_HOME=/opt/maven
     export PATH=$PATH:$M2_HOME/bin
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
   - [Optional] Run the following to clean up previously installed NVIM
     ```
     sudo rm /usr/bin/nvim
     sudo rm -rf /opt/nvim*
     sudo rm -rf /usr/lib/nvim
     rm -rf /usr/share/nvim
     rm -rf ~/.config/nvim
     rm -rf ~/.local/share/nvim
     rm -rf ~/.local/state/nvim
     rm -rf ~/.cache/nvim
     ```
   - Download latest NVIM: https://github.com/neovim/neovim/blob/master/INSTALL.md
     ```
     cd ~/Downloads
     sudo tar -C /opt -zvxf nvim-linux-x86_64.tar.gz
     sudo cp /opt/nvim-linux-x86_64/bin/nvim /usr/bin/nvim
     ```
   - Add the following to ~/.bashrc or ~/.zshrc
     ```
     export PATH=$PATH:/opt/nvim-linux-x86_64/bin
     ```
   - Setup NVIM (options, plugins, etc.)
     ```
     git clone https://github.com/victorlamprojects/Settings.git
     cp -r ./Settings/Linux\ Setup/nvim/nvim ~/.config  
     ```

