{ config, pkgs, ... }:

{
  home.username = "tav";
  home.homeDirectory = "/home/tav";

  home.stateVersion = "22.11";

  home.packages = [
    pkgs.brightnessctl
    pkgs.fzf
    pkgs.gocryptfs
    pkgs.grim
    pkgs.rofi
    pkgs.rclone
    pkgs.vscode
    pkgs.firefox
    pkgs.bitwarden
    pkgs.vagrant
    pkgs.kubectl
    pkgs.ansible
    pkgs.waybar
    pkgs.vlc
    pkgs.helix
    pkgs.rustup
    pkgs.chromium
    pkgs.signal-desktop
    pkgs.telegram-desktop
    pkgs.discord
    pkgs.unzip
    pkgs.spotify
    pkgs.nmap
    pkgs.ffuf
    pkgs.stack
    pkgs.bat
    pkgs.exa
    pkgs.libreoffice-fresh
    pkgs.starship
    pkgs.btop
    pkgs.jq
    pkgs.ripgrep
    pkgs.openssh
    pkgs.tor
    pkgs.torsocks
    pkgs.tor-browser-bundle-bin
    pkgs.proxychains-ng
    pkgs.restic
    pkgs.bluez
    pkgs.youtube-dl
    pkgs.fd
    pkgs.zoxide
    pkgs.tealdeer
    pkgs.evince
    pkgs.python311Packages.python-lsp-server
    pkgs.python311Packages.autopep8
    pkgs.obsidian
    pkgs.go
    pkgs.dig
    pkgs.wget
    pkgs.inetutils
    pkgs.exiftool
  ];


  home.file = {
    ".config/alacritty-admin.yml".source = ~/dotfiles/.config/alacritty-admin.yml;
    ".config/alacritty-day.yml".source = ~/dotfiles/.config/alacritty-day.yml;
    ".config/alacritty-kali.yml".source = ~/dotfiles/.config/alacritty-kali.yml;
    ".config/alacritty-night.yml".source = ~/dotfiles/.config/alacritty-night.yml;
    ".config/alacritty-ubuntu.yml".source = ~/dotfiles/.config/alacritty-ubuntu.yml;
    ".config/alacritty.yml".source = ~/dotfiles/.config/alacritty.yml;
    ".config/containers/registries.conf".source = ~/dotfiles/.config/containers/registries.conf;
    ".config/containers/storage.conf".source = ~/dotfiles/.config/containers/storage.conf;
    ".config/helix/languages.toml".source = ~/dotfiles/.config/helix/languages.toml;
    ".config/helix/config.toml".source = ~/dotfiles/.config/helix/config.toml;
    ".config/rofi/launcher.rasi".source = ~/dotfiles/.config/rofi/launcher.rasi;
    ".config/sway/assets/wp-day.jpg".source = ~/dotfiles/.config/sway/assets/wp-day.jpg;
    ".config/sway/assets/wp-night.jpg".source = ~/dotfiles/.config/sway/assets/wp-night.jpg;
    ".config/sway/assets/wp.jpg".source = ~/dotfiles/.config/sway/assets/wp.jpg;
    ".config/sway/config".source = ~/dotfiles/.config/sway/config;
    ".config/waybar/config".source = ~/dotfiles/.config/waybar/config;
    ".config/waybar/style-day.css".source = ~/dotfiles/.config/waybar/style-day.css;
    ".config/waybar/style-night.css".source = ~/dotfiles/.config/waybar/style-night.css;
    ".config/waybar/style.css".source = ~/dotfiles/.config/waybar/style.css;
    ".config/starship.toml".source = ~/dotfiles/.config/starship.toml;
    ".config/fontconfig/fonts.conf".source = ~/dotfiles/.config/fontconfig/fonts.conf;
    ".zshrc".source = ~/dotfiles/.zshrc;
  };

  programs.home-manager.enable = true;
}

