# Sanctum

> *"From the ashes, we will rise."*

A Home Manager configuration inspired by **[The 100](https://en.wikipedia.org/wiki/The_100_(TV_series))** universe—specifically **Sanctum**, the sanctuary world and home of the Children of Gabriel.

Just as Sanctum served as a refuge and place of transformation in the show, this repo is my digital sanctuary—a carefully crafted Nix environment that rises from the ashes of chaotic dotfiles.

---

## Structure

```
├── flake.nix          # Entry point
├── modules/           # Reusable modules (CLI tools, dev environments)
├── users/             # User configurations
│   └── thein3rovert/  # May we meet again
└── overlays/          # Custom package overrides
```

---

## Usage

```bash
# Build and activate
home-manager switch --flake .#thein3rovert@sanctum
```

---

## Features

- **Shell**: Nushell + starship prompt
- **Dev environments**: Go, Python, Nix
- **Tools**: fzf, difftastic, jujutsu
- **Philosophy**: Declarative, reproducible, *cool*

---

*May we meet again.* 🚀
