#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/git/completion/git-prompt.sh

alias anicli='ani-cli --dub'
#alias anicli='ani-cli --dub --skip'
alias aurUpdates='yay -Qua'
alias cat='bat --style header --style snip --style changes --style header'
alias ......='cd ../../../../..'
alias .....='cd ../../../..'
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias cfg='cd $CONFDIR'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias continue='ani-cli --dub -c'
#alias continue='ani-cli --dub -c --skip'
alias cpuInfo='lscpu'
alias dir='dir --color=auto'
alias diskInfo='df -hT --exclude-type=tmpfs --exclude-type=devtmpfs'
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'
alias fixPacman='sudo rm /var/lib/pacman/db.lck'
alias fullUpdate='yay -Syyu && sudo pacman -Syyu'
alias ga='git add'
alias gc='git commit -m'
alias gitPkg="pacman -Q | grep -i '\-git' | wc -l" # List amount of -git packages
alias gl='git log --oneline --graph --decorate'
alias gp='git push'
alias grep='ugrep --color=auto'
alias gs='git status'
alias hw='hwinfo --short' # Hardware Info
alias ip='ip -color'
alias jctl='journalctl -p 3 -xb'
alias la='exa -a --color=always --group-directories-first --icons' # all files and dirs
alias lastBootLog='journalctl -p 3..4 --boot -o short-monotonic | uniq'
alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles
alias listAllPkg='pacman -Qqe'
alias ll='exa -l --color=always --group-directories-first --icons' # long format
alias lock=''
alias logout=''
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias makeExec='chmod +x'
alias memInfo='free -h --si'
alias now="date +'  %H:%M:%S %Y/%m/%d'"
alias off='shutdown -h now'
alias pacFind='pacman -Ss'
alias pacin='sudo pacman -S --needed'
alias pacUpdates='checkupdates'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias psmem='ps auxf | sort -nr -k 4'
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias rmAur='yay -Rns'
alias rmPac='sudo pacman -Rns'
alias savePkgLists="pacman -Qqe | grep -vxF -f <(pacman -Qqm) | grep -v '^yay$' > $HOME/Downloads/official_packages.txt && pacman -Qqm | grep -v '^yay$' > $HOME/Downloads/aur_packages.txt"
alias startSSH="eval '$(ssh-agent -s)' && ssh-add ~/.ssh/id_ed25519 && ssh -T git@github.com"
alias symlinkDir='ln -sfT'
alias symlinkFile='ln -sf'
alias take='sudo chown -R $USER:$USER'
alias tattach='tmux attach -t'
alias tb='nc termbin.com 9999'
alias tdetach='tmux detach'
alias tkillp='tmux kill-pane'
alias tkill='tmux kill-session -t'
alias tls='tmux ls'
alias tnew='tmux new -s'
alias tneww='tmux new-window'
alias tnext='tmux next-window'
alias tprev='tmux previous-window'
alias tren='tmux rename-window'
alias tresize='tmux resize-pane'
alias tsplit-h='tmux split-window -h'
alias tsplit-v='tmux split-window -v'
alias tswitch='tmux select-pane'
alias updateMirrorList='sudo reflector --verbose --latest 200 --sort rate --country za --save /etc/pacman.d/mirrorlist'
alias vdir='vdir --color=auto'
alias viewTar='tar -tf'
alias viewZip='unzip -l'
alias watch='watch -n 1 date'
alias wget='wget -c'
alias whatCmd='apropos'
alias yayFind='yay -Ss'
alias yayin='yay -S --needed'

PS1="\[\033[1;34m\][\u@\h \W$(__git_ps1 " (%s)")]\$\[\033[0m\] "

HISTSIZE=10000
HISTFILESIZE=20000

shopt -s expand_aliases
shopt -s histappend
shopt -s cmdhist

PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export SUDO_PROMPT="$(tput setaf 1 bold)Please provide your sudo password:$(tput sgr0) "
export VISUAL=nvim
export EDITOR=nvim
export CONFDIR="$HOME/.vanilla_arch_dwm/"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

eval "$(starship init bash)"
eval "$(register-python-argcomplete pipx)"

installOfficialFromList() {
  sudo pacman -S --needed - <"$1"
}

installAurFromList() {
  yay -S --needed - <"$1"
}

workon() {
  source "$1/bin/activate"
}

extract() {

  if [ -f "$1" ]; then
    case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.tar.xz) tar xJf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.rar) unrar x "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.7z) 7z x "$1" ;;
    *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi

}

makeDiff() {

  local current_version="$1"
  local new_version="$2"
  local output_filename="$3"

  if [[ -z "$current_version" || -z "$new_version" || -z "$output_filename" ]]; then
    echo "Usage: makeDiff <current_version> <new_version> <output_filename>"
    return 1
  fi

  if [[ ! -f "$current_version" ]]; then
    echo "Error: <current_version> file '$current_version' does not exist."
    return 1
  fi

  if [[ ! -f "$new_version" ]]; then
    echo "Error: <new_version> file '$new_version' does not exist."
    return 1
  fi

  sudo diff -u "$current_version" "$new_version" >"$HOME/Downloads/${output_filename}.patch"

  local diff_exit_code=$?

  if [[ $diff_exit_code -eq 0 ]]; then
    echo "No differences found between files. No patch created."
    rm -f "$HOME/Downloads/${output_filename}.patch" # Clean up empty file
    return 0
  elif [[ $diff_exit_code -eq 1 ]]; then
    echo "Patch file created: $HOME/Downloads/${output_filename}.patch"
    return 0
  else
    echo "Error: Failed to create patch file."
    return 1
  fi

}

patchDiff() {

  local original_file="$1"
  local diff_file="$2"

  if [[ -z "$original_file" || -z "$diff_file" ]]; then
    echo "Usage: patchDiff <original_file> <diff_file>"
    return 1
  fi

  if [[ ! -f "$original_file" ]]; then
    echo "Error: Original file '$original_file' does not exist."
    return 1
  fi

  if [[ ! -f "$diff_file" ]]; then
    echo "Error: Diff file '$diff_file' does not exist."
    return 1
  fi

  if sudo patch --dry-run "$original_file" <"$diff_file"; then
    if sudo patch "$original_file" <"$diff_file"; then
      echo "Successfully patched diffs to '$original_file'."
      return 0
    else
      echo "Error: Unexpected failure while applying the patch."
      return 1
    fi
  else
    echo "Error: Patch would fail or partially apply. No changes made."
    return 1
  fi

}

cpv() {
  if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: cpv <source> <destination>"
    return 1
  fi

  local src="$1"
  local dest="$2"

  if [[ ! -d "$src" ]]; then
    echo "Error: '$src' is not a directory"
    return 1
  fi

  local src_base
  src_base=$(basename "$src")

  tar -cf - -C "$(dirname "$src")" "$src_base" | pv | tar -xf - -C "$dest"
}

y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

writeiso() {
  # -----------------------------------------------------------------------------
  # writeiso - Safely write a bootable ISO to a USB device using dd
  #
  # USAGE:
  #   writeiso /path/to/file.iso /dev/sdX
  #
  # ARGUMENTS:
  #   $1 - Path to the ISO file (e.g., ~/Downloads/archlinux-*.iso)
  #   $2 - Target device (e.g., /dev/sdb — not a partition like /dev/sdb1)
  #
  # DESCRIPTION:
  #   - Automatically unmounts all mounted partitions on the target device.
  #   - Uses dd with optimal options for performance and safety.
  #   - Displays progress and syncs writes to reduce corruption risk.
  #
  # HOW TO FIND YOUR USB DEVICE:
  #   Run: lsblk
  #   Look for your USB stick based on size and name.
  #   Example output:
  #     sdb      8:16   1   7.5G  0 disk
  #     └─sdb1   8:17   1   7.5G  0 part /run/media/clinton/ARCH_*
  #   In this case, the correct target is /dev/sdb
  # -----------------------------------------------------------------------------

  local ISO="$1"
  local TARGET="$2"

  if [[ -z "$ISO" || -z "$TARGET" ]]; then
    echo "Usage: writeiso /path/to/iso /dev/sdX"
    return 1
  fi

  if [[ ! -f "$ISO" ]]; then
    echo "Error: ISO file not found at $ISO"
    return 1
  fi

  if [[ ! -b "$TARGET" ]]; then
    echo "Error: Target $TARGET is not a block device"
    return 1
  fi

  echo "🔍 Unmounting partitions on $TARGET..."
  for part in $(lsblk -ln "$TARGET" | awk '{print $1}'); do
    sudo umount "/dev/$part" 2>/dev/null
  done

  echo "⚠️ Writing $ISO to $TARGET with dd..."
  sudo dd bs=4M if="$ISO" of="$TARGET" status=progress oflag=sync

  echo "✅ Done. You may now eject the device:"
  echo "   sudo eject $TARGET"
}

autopatch() {
  : '
    autopatch <patch-file>

    Attempts to apply a patch file with the correct -pN level automatically.
    It tries -p0, -p1, and -p2 in order, and runs a dry-run patch to detect success.
    On success, it prompts the user to confirm application before proceeding.

    Usage:
        autopatch mypatch.diff

    Example:
        autopatch dwm-scratchpads-20200414.diff

    Notes:
        - The patch must be a valid unified diff file.
        - The function prints which levels succeed or fail for transparency.
        - Only applies the patch after interactive confirmation.
        - Designed for use inside git repositories or local source trees.
    '
  if [[ -z "$1" || ! -f "$1" ]]; then
    echo "Usage: autopatch <patch-file>"
    return 1
  fi

  local patchfile="$1"
  local level
  local success=false

  for level in 0 1 2; do
    if patch -p"$level" --dry-run <"$patchfile" >/dev/null 2>&1; then
      echo "✅ Dry-run succeeded at -p$level"
      success=true
      break
    else
      echo "❌ Dry-run failed at -p$level"
    fi
  done

  if ! $success; then
    echo "✘ Patch could not be applied with -p0, -p1, or -p2"
    return 1
  fi

  read -rp "Apply patch with -p$level? [y/N] " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    patch -p"$level" <"$patchfile"
  else
    echo "⚠️  Patch not applied."
    return 1
  fi
}
