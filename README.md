# Vanilla arch with dwm config

Install microcode for cpu and display drivers depending on system e.g amd-ucode vulkan-radeon xf86-video-amdgpu for amd cpu and gpu.

Install sound drivers and tui if not installed with arch e.g.pipewire pipewire-pulse pipewire-alsa pulsemixer

Install kernel headers depending on kernel selected e.g. linux-headers or linux-zen-headers

'''bash
xinput set-prop 10 "libinput Natural Scrolling Enabled" 1
'''

'''bash
sudo pacman -S --needed git base base-devel libx11 libxft libxinerama freetype2 fontconfig neovim xorg-xinit xorg-server xorg-xinput numlockx webkit2gtk xclip bash-completion bat btop cargo curl expac eza fastfetch fd feh ffmpeg fzf gimp glow go hwinfo imagemagick inkscape jq lazygit less lynx man-db mpv noto-fonts-emoji patch pipewire-alsa pipewire-pulse pulsemixer pv python-pipx python-pynvim python-tinycss2 reflector ripgrep rsync ruby rust sed sshfs starship syncthing termusic thunderbird tldr tmux tree poppler tumbler udiskie ugrep unrar 7zip unzip yazi yt-dlp zoxide openssh xorg-xev mesa-utils xorg-xsetroot xorg-xwininfo pavucontrol
'''

'''bash
yay -S --needed thorium-browser-bin resvg ani-cli ani-skip-git
'''

'''bash
git config --global init.defaultBranch main
'''

'''bash
git clone https://github.com/TheRealMDK/arch-hypr-dots.git ~/.arch-hypr-dots
'''

'''bash
git clone https://github.com/TheRealMDK/vanilla_arch_dwm.git ~/.vanilla_arch_dwm
'''

'''bash
git clone git://git.suckless.org/dwm ~/.suckless/dwm
'''

'''bash
git clone git://git.suckless.org/st ~/.suckless/st
'''

'''bash
git clone git://git.suckless.org/dmenu ~/.suckless/dmenu
'''

'''bash
git clone https://aur.archlinux.org/yay.git
'''

'''bash
fc-cache -fv
'''

'''bash
systemctl --user enable pipewire.service
'''

'''bash
systemctl --user enable pipewire-pulse.service
'''

'''bash
systemctl --user enable wireplumber.service
'''

'''bash
eval "$(dbus-launch --sh-syntax --exit-with-session)"
'''

'''bash
git clone git@github.com:TheRealMDK/vanilla_arch_dwm.git ~/.vanilla_arch_dwm
'''

'''bash
'''

'''bash
'''

'''bash
'''

'''bash
'''
