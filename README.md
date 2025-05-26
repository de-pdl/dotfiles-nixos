# dotfiles
uh live laugh love life 

With great power comes great responsibility, but what crimes have I commited to be adorned with burdens for the sake of my 2 am commitments.


Currently trying to follow this layout:
config/
├── flake.nix
└── pkgs
    ├── cli
    │   └── default.nix          # module that sets up your CLI tools & dotfiles
    └── gui
        ├── env
        │   ├── gui_environment1
        │   │   ├── default.nix  # module #1
        │   │   └── hyprland.nix  # e.g. your hyprland‐environment
        │   └── gui_environment2
        │       ├── default.nix  # module #2
        │       └── sway.nix     # e.g. your sway‐environment
        └── gui_usr_apps
            └── default.nix      # here you expose a package set of “apps”

