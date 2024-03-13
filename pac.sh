#!/bin/bash

record_file="$HOME/.config/my_tools/install.sh"

# Check if my_tools directory exists, if not create it
my_tools_dir="$HOME/.config/my_tools"
if [ ! -d "$my_tools_dir" ]; then
    mkdir -p "$my_tools_dir"
fi

# Check if record file exists, if not create it with shebang
if [ ! -e "$record_file" ]; then
    touch "$record_file"
    echo "#!/bin/zsh" > "$record_file"
    chmod +x "$record_file"
fi

add_to_record() {
    echo "pacman $pacman_command ${packages[@]}" >> "$record_file"
    chmod +x "$record_file"
}

if [ "$#" -eq 0 ]; then
    echo "No arguments provided."
    exit 1
fi

packages=()

for arg in "$@"; do
    if [[ $arg == -* ]]; then
        # Add flag to pacman command
        pacman_command="$pacman_command $arg"
    else
        packages+=("$arg")
    fi
done

pacman_command="$pacman_command" pacman $pacman_command "${packages[@]}"

echo "Do you want to add the installed package to your record? (yes/no):"
read response
if [[ $response == "y" || $response == "Y" || $response == "yes" ]]; then
    add_to_record
fi
