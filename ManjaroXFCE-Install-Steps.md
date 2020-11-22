# Install Steps after Installation of Base version of Manjaro XFCE

## 1. Correction to Fail to Lockout File

```shell
sudo nano /etc/security/faillock.conf
```

Need to change the `deny = 5` 
Instead of `# deny = 3`.
It is in **Line 32** or so.

## 2. Configure Pacman Mirror Fetch

```shell
sudo nano /etc/pacman-mirrors.conf
```

Need to change **Line 22** to `Protocols = https`
And **Line 27** or Last line to `SSLVerify = True`

Quick Replace script:

```shell
# Switch the Protocol to HTTPS
sudo sed -i 's/# Protocols =/Protocols = https/g' /etc/pacman-mirrors.conf
# Enable SSL Certificate Verification
sudo sed -i 's/# SSLVerify/SSLVerify/g' /etc/pacman-mirrors.conf
```

## 3. Update the Mirrors:

### Command-line

```shell
# Update the Mirror List with max timeout for search 5 seconds
sudo pacman-mirrors --timeout 5 --country United_States Japan
# Update all Packages from these updated mirrors
sudo pacman -Syyu
```

### Using `pamac` GUI:

1. Open `pamac` User interface `Add/Remove Software`
2. In the 3 dot side menu , click on `Preferences` - Authenticate
3. Go to `Official Repositories`
4. Set the Desired Country from drop-down
5. Click on `Refresh Mirror List`
6. After the Refresh is complete - close the dialog
7. Use the same menu to `Refresh Database`

### Check the Generated Mirror List

```shell
cat /etc/pacman.d/mirrorlist 
```

## 4. Remove `Snapd` and `flatpak` from `pamac`

```shell
pamac remove snapd
pamac remove flatpak
```

## 5. Install Essentials Software

```shell
# Password Manager and Secure Vault - seahorse for Linux Keyring
sudo pacman -S keepassxc veracrypt seahorse
# My favorite Disk manager
sudo pacman -S gnome-disk-utility
# Backup Software for Projects
sudo pacman -S restic
# Basic Editor for Text - gedit
sudo pacman -S gedit
# Remove the Other editors
pamac remove mousepad
# Command line Utilities
sudo pacman -S tree tmux arch-audit 
# Hard Disk management tools
sudo pacman -S smartmontools hddtemp
# Docker
sudo pacman -S docker
# Source Manipulation and Much needed programming languages
sudo pacman -S code gitg python-pygments go nodejs npm \
 nano-syntax-highlighting meld
# For Concatenating PDF files
sudo pacman -S pdfarranger
# Embedded Essentials
sudo pacman -S openocd moserial lrzsz picocom stlink python-pyserial
# Telegram
sudo pacman -S telegram-desktop
# Multimedia essentials
sudo pacman -S audacity simplescreenrecorder youtube-dl gthumb
# File Recovery Software - PhotoRec + testdisk
sudo pacman -S testdisk
# Cleaner Software
sudo pacman -S bleachbit
# Remove the default Image Viewer
pamac remove viewnior
```

## 6. Fix User Permissions for Groups

```shell
# For Serial Port Access
sudo usermod -aG uucp $USER
sudo usermod -aG lock $USER
# For Non-sudo docker access
sudo usermod -aG docker $USER
```

## 7. Mount the Backup-disk always

### Find the UUID for the backup disk

```shell
blkid

# Output
....
/dev/sda1: LABEL="Backup" UUID="12345c24-4837-4d31-b19c-12345a9b06cc" BLOCK_SIZE="4096" TYPE="ext4" PARTLABEL="Backup-Linux" PARTUUID="8234fdcd-a32b-4f82-a6ed-13d4f2f6f6fe"
....
```

### Edit the FSTAB file to Mount the Disk

```shell
# Create the Location to Mount
sudo mkdir /Backup
# Edit the fstab file
sudo nano /etc/fstab

# Add the Line to End of the File
UUID=12345c24-4837-4d31-b19c-12345a9b06cc             /Backup        ext4    defaults,noatime 0 0
```

## 8. Personalization

Run the `./install-profile -f` Command to finish the personalization
process for the shell.
