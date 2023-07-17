#!/bin/bash
# Author: karateSwag
# Repo: https://github.com/karateswag/dotfiles

# Version
version="v1.1"

# Retrieve the directory path of the script
script_dir="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
target_dir="$HOME"
required_dirs=(
  ".config"
  # Add more required directories as needed
)
dotfiles=(
  ".zshrc"
  ".p10k.zsh"
  ".config/alacritty"
  ".config/dunst"
  ".config/gtk-3.0"
  ".config/hypr"
  ".config/nvim"
  ".config/swaylock"
  ".config/tofi"
  ".config/wallpapers"
  ".config/waybar"
  ".config/wlogout"
  # Add more dotfiles as needed
)

link_dotfile() {
  local source_location=$1
  local target_location=$2
  if [ -e "$target_location" ] || [ -d "$target_location" ]; then
    echo "$target_location already exists! Skipping the operation."
    echo " "
  else
    echo "Creating symbolic link of $source_location at $target_location"
    ln -s "$source_location" "$target_location"
    echo " "
  fi
}

link_prompt() {
  local dotfile=$1
  read -rp "Do you want to link $dotfile? (Y/n): " choice
  choice="${choice:-Y}"
  [[ $choice == "y" || $choice == "Y" ]]
}

version_prompt() {
  local dotfile=$1
  read -rp "Choose version to install: (D)esktop/(l)aptop ? " version_choice
  version_choice="${version_choice:-D}"
  return $version_choice
}

version_prompt() {
  local dotfile=$1
  read -rp "Choose version of $dotfile to install: (D)esktop/(l)aptop ? " version_choice
  version_choice="${version_choice:-D}"
  if [[ $version_choice == "D" || $version_choice == "d" ]]; then
    dotfile_version="desktop"
  elif [[ $version_choice == "L" || $version_choice == "l" ]]; then
    dotfile_version="laptop"
  else
    dotfile_version=""
  fi
}

check_create_directory() {
  local directory=$1
  local full_dir="$target_dir/$directory"
  if [ ! -d "$full_dir" ]; then
    read -rp "The directory $full_dir does not exist. Create it? (Y/n): " create_choice
    create_choice="${create_choice:-Y}"
    if [[ $create_choice == "y" || $create_choice == "Y" ]]; then
      echo "Creating $full_dir"
      mkdir -p "$full_dir"
      echo " "
    else
      echo "Skipping the operation."
      echo " "
      exit 0
    fi
  fi
}

# Running script:
echo "*********************************************************************************"
echo "Running dotfiles_setup.sh $version by karateSwag!"
echo "*********************************************************************************"
echo " "

# Check if required directories exist and create them if necessary
echo "*********************************************************************************"
echo "Checking missing directories:"
echo " "
for required_dir in "${required_dirs[@]}"; do
  check_create_directory "$required_dir"
done

# Link dotfiles
echo "*********************************************************************************"
echo "Creating symbolic links to dotfiles:"
echo "                           "

for dotfile in "${dotfiles[@]}"; do
  if link_prompt "$dotfile"; then
    source_location="$script_dir/$dotfile"
    target_location="$target_dir/$dotfile"
    link_dotfile "$source_location" "$target_location"
    if [[ $dotfile == ".config/hypr" ]]; then
      version_prompt "$dotfile"
      if [[ ! $dotfile_version == "" ]]; then
        link_dotfile "config/$dotfile_version.conf" "$target_location/hyprland.conf"
      fi
    fi
  else
    echo "Skipping the operation."
  fi
done

echo "Task completed!"
