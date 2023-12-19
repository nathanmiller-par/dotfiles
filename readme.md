# Install Instructions

```bash
# Install zsh
sudo apt install zsh
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerline fonts
sudo apt install powerline
git clone https://github.com/powerline/fonts.git && cd fonts && sh ./install.sh

cd dotfiles
./install.sh
```

## If using VS Code
1. Download and install "DroidSansM" from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
2. Change the editor or integrated terminal font to "DroidSansM Nerd Font".