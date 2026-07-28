# dotfiles

Personal configs, themed to match VS Code **Dark 2026** across the whole stack.

| Package | What it configures |
|---|---|
| `nvim` | Neovim (LazyVim) — Dark 2026 colors, rainbow brackets, bufferline, Diffview |
| `ghostty` | Ghostty terminal — Dark 2026 theme, Shift+Enter for TUI agents |
| `herdr` | herdr multiplexer — keybinds + Dark 2026 UI colors (config.toml only; runtime files stay local) |
| `hunk` | hunk diff viewer — Dark 2026 custom theme (config.toml only; state.json stays local) |
| `zsh` | zsh shell — Oh My Zsh + Powerlevel10k prompt, deduped `$PATH`, tool loaders (`.zshrc` + `.p10k.zsh`) |

## Setup

```sh
git clone git@github.com:builtbystef/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --target="$HOME" nvim ghostty herdr hunk zsh   # or just the packages you want
```

Requires [GNU Stow](https://www.gnu.org/software/stow/). Stow symlinks each
package's contents into `$HOME`; it refuses to overwrite existing files, so
move any pre-existing configs aside first. Undo with `stow -D <package>`.

### zsh prerequisites

The `zsh` package is only the config — Oh My Zsh and the Powerlevel10k theme
must exist before `.zshrc` will load. Install them **before** stowing, in this
order:

```sh
# 1. Oh My Zsh — KEEP_ZSHRC=yes stops the installer writing its own ~/.zshrc,
#    which would otherwise block stow.
KEEP_ZSHRC=yes RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 2. Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# 3. Now stow, and make zsh the login shell
cd ~/dotfiles && stow --target="$HOME" zsh
chsh -s "$(command -v zsh)"
```

The prompt also needs a **Nerd Font v3** (the `ghostty` package expects one
too) — without it the prompt icons render as boxes. Don't run `p10k configure`
unless you want to regenerate `.p10k.zsh` from scratch; the committed one is
already themed.

Optional tools referenced by `.zshrc` — [uv](https://docs.astral.sh/uv/),
[nvm](https://github.com/nvm-sh/nvm), [bun](https://bun.sh), Go, and Neovim at
`/opt/nvim` — are all loaded behind existence guards, so the shell starts
cleanly on a machine that has none of them. Install what you need and the
matching lines start working; the `$PATH` array in `.zshrc` is deduped via
`typeset -U`, so entries for tools you skip are harmless.
