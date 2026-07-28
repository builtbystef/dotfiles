# dotfiles

Personal configs, themed to match VS Code **Dark 2026** across the whole stack.

| Package | What it configures |
|---|---|
| `nvim` | Neovim (LazyVim) — Dark 2026 colors, rainbow brackets, bufferline, Diffview |
| `ghostty` | Ghostty terminal — Dark 2026 theme, Shift+Enter for TUI agents |
| `herdr` | herdr multiplexer — keybinds + Dark 2026 UI colors (config.toml only; runtime files stay local) |
| `hunk` | hunk diff viewer — Dark 2026 custom theme (config.toml only; state.json stays local) |

## Setup

```sh
git clone git@github.com:builtbystef/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --target="$HOME" nvim ghostty herdr hunk   # or just the packages you want
```

Requires [GNU Stow](https://www.gnu.org/software/stow/). Stow symlinks each
package's contents into `$HOME`; it refuses to overwrite existing files, so
move any pre-existing configs aside first. Undo with `stow -D <package>`.
