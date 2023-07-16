#!/bin/bash
# Author: karateSwag
# Repo: https://github.com/karateswag/dotfiles

# version
VERSION="v1.0"

# Retrieve the directory path of the script
SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
TARGET_DIR="$HOME"
REQUIRED_DIR=(
  ".config"
  # Add more required directories as needed
)
DOTFILES_LIST=(
  ".zshrc"
  ".p10k.zsh"
  ".config/alacritty"
  ".config/dunst"
  ".config/hypr"
  ".config/nvim"
  ".config/swaylock"
  ".config/tofi"
  ".config/waybar"
  ".config/wlogout"
  # Add more dotfiles as needed
)

link_dotfile() {
  local source_location=$1
  local target_location=$2
  if [ -e "$target_location" ] || [ -d "$target_location" ]; then
    echo "$target_location already exists! Skipping the action."
    echo " "
  else
    echo "Creating simlink of $source_location at $target_location"
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

choose_version() {
  local dotfile=$1
  read -rp "Which version of $dotfile? (D)esktop/(l)aptop: " version_choice
  # version_choice="${version_choice,,}"
  version_choice="${version_choice:-D}"
  if [[ $version_choice == "d" || $version_choice == "D" ]]; then
    echo "desktop"
  elif [[ $version_choice == "l" || $version_choice == "L" ]]; then
    echo "laptop"
  else
    return 1
  fi
}

check_create_directory() {
  local directory=$1
  local full_dir="$TARGET_DIR/$directory"
  if [ ! -d "$full_dir" ]; then
    read -rp "The directory $full_dir does not exist. Create it? (Y/n): " create_choice
    create_choice="${create_choice:-Y}"
    if [[ $create_choice == "y" || $create_choice == "Y" ]]; then
      echo "Creating $full_dir"
      mkdir -p "$full_dir"
      echo " "
    else
      echo "Skipping the action."
      echo " "
      exit 0
    fi
  fi
}

# Running script:
echo "*********************************************************************************"
echo "Running dotfiles_setup.sh $VERSION by karateSwag !"
echo "*********************************************************************************"
echo " "

# Check if required directories exist and create them if necessary
echo "*********************************************************************************"
echo "Checking missing directories:"
echo " "
for required_dir in "${REQUIRED_DIR[@]}"; do
  check_create_directory "$required_dir"
done

# Link dotfiles
echo "*********************************************************************************"
echo "Creating symlinks to dotfiles:"
echo "                           "

for dotfile in "${DOTFILES_LIST[@]}"; do
  if link_prompt "$dotfile"; then
    source_location=""
    target_location="$TARGET_DIR/$dotfile"

    if [[ -d "$SCRIPT_DIR/$dotfile/desktop" && -d "$SCRIPT_DIR/$dotfile/laptop" ]]; then
      version=$(choose_version "$dotfile")
      if [[ -n $version ]]; then
        source_location="$SCRIPT_DIR/$dotfile/$version"
      fi
    else
      source_location="$SCRIPT_DIR/$dotfile"
    fi

    if [[ -n $source_location ]]; then
      link_dotfile "$source_location" "$target_location"
    else
      echo "Skipping the action."
    fi
  else
    echo "Skipping the action."
  fi
done

echo "Task completed!"
