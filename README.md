## Setup

1. Nix Setup

```bash
curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install
```

```bash
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
```

```bash
nix --version
```

2. Git Setup

```bash
git config --global user.name "username"
```

```bash
git config --global user.email "user@example.com"
```

```bash
git config --global ghq.root '~/src'
```

3. Clone Repository

```bash
nix run nixpkgs#ghq get myuron/dotfiles-wsl
```

4. Build Environment

```bash
nix run .#home
```

5. Shell Setup
```bash
echo $(which fish) | sudo tee -a /etc/shells
```
```bash
chsh -s $(which fish)
```
