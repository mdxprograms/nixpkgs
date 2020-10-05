# Nix the world

My home-manager, direnv, nix setup

### Setup

Clone this repo into `~/.config` with default name of repo being used as the directory

1. Install nix if not already available:

```bash
curl -L https://nixos.org/nix/install | sh
```

2. Add the unstable channel and home-manager channel:

```bash
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

3. Install home-manager for default programs and tooling setup and activate from `~/`

```bash
nix-shell '<home-manager>' -A install
home-manager switch
```

4. Install `direnv` to automatically pick up local packages and configurations to specific projects when changing into their respective directories.

```bash
# via arch AUR
yay -S direnv

# macOS
brew install direnv
```

5. Create a `.envrc` with `use nix` as its content in each project that uses nix and run `direnv allow .` within the project to allow direnv to auto enable and disable nix packages for the project.
   Anything inside of `shell.nix` within a project directory will be available when running `nix-shell shell.nix`
