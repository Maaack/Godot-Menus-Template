#!/bin/bash


file=rsync-source-location.txt

# Check if the file exists
if [ ! -e $file ]; then
    # File doesn't exist, create an empty one
    touch $file
fi

# File exists, read the first line into a variable
read -r source < $file
    
if [ -z "$source" ]; then
    # File is empty, prompt the user for input
    echo "Please enter the source folder (contains project.godot)."
    read -r user_input
    
    # Save user input to the file
    echo "$user_input" > "$file"
    echo "Source saved to $file."
    source="$user_input"
fi

# Source and destination directors
src_dir="$source/addons/maaacks_game_template/"
dest_dir="../addons/maaacks_menus_template/"

echo $src_dir
rsync -av --existing "$src_dir/" "$dest_dir"

# Define strings to replace
finds=("game_template" "Game Template" "GameTemplate" "Game-Template" "game-template")
replaces=("menus_template" "Menus Template" "MenusTemplate" "Menus-Template" "menus-template")

# Checks for strings and replaces them
for ((i=0; i<${#finds[@]}; i++)); do
    find="${finds[i]}"
    replace="${replaces[i]}"
    
    # Find and replace in all files in the destination directory
    find "$dest_dir" -type f -exec sed -i "s/${find}/${replace}/g" {} +
done
