# GNOME Theme Setup

## 1. Go to "Software & Updates"
## 2. Make sure "Community-maintained free and open-source software (universe) is checked
![alt text](/img/SoftwareSettings.png?raw=true)
## 3. Make sure gnome tweaks is installed
If not, 
```
sudo apt-get install gnome-tweaks
```
## 4. Download GTK theme
### 1. Go to https://www.gnome-look.org/p/1661959
### 2. Click Files
### 3. Download Colloid-Dark-Dracula.tar.xz
### 4. Extract Files
```
tar -xvf Colloid-Dark-Dracula.tar.xz
```
### 5. Add to Tweaks
```
mkdir -p ~/.themes
mv Colloid-Dark-Dracula ~/.themes/Colloid-Dark-Dracula
```
## 5. Download icons theme
### 1. Go to https://www.gnome-look.org/p/1661983
### 2. Click Files
### 3. Download Colloid-teal.tar.xz
### 4. Extract Files
```
tar -xvf Colloid-teal.tar.xz
```
### 5. Add to Tweaks
```
mkdir -p ~/.icons
mv Colloid-teal ~/.icons/Colloid-teal
mv Colloid-teal-dark ~/.icons/Colloid-teal-dark
mv Colloid-teal-light ~/.icons/Colloid-teal-light
```
## 6. Open the Tweaks apps
## 7. Go to appearance and update application and icons themes to Colloid-teal-dark

## For any issues, reset the gnome theme
```
gsettings set org.gnome.desktop.interface icon-theme 'elementary'
```
