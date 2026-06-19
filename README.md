# myuron's dotfiles

## Setup

### Distributions other than NixOS

1. Nix Setup

```bash
curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install

. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

nix run home-manager/master -- switch --flake .
```

2. Git Setup

```bash
git config --global user.name "username"

git config --global user.email "user@example.com"

git config --global ghq.root '~/src'
```

3. Clone Repository

```bash
nix run nixpkgs#ghq get myuron/dotfiles-wsl
```

4. Build Environment

```bash
cd ~/src/github.com/myuron/dotfiles-wsl
nix run .#home
```

5. Shell Setup

```bash
echo $(which fish) | sudo tee -a /etc/shells

chsh -s $(which fish)
```

## Emacs(org-mode) Setup

1. setup org-agenda

```bash
mkdir ~/org
```

2. setup org-roam

```bash
ghq get myuron/org-roam
```