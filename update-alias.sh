#!/bin/bash

CONFIG_FILE="$HOME/.bashrc"

ALIAS_NAME_32="wine32"
ALIAS_COMMAND_32="alias $ALIAS_NAME_32='bash $(pwd)/wine32.sh'"

ALIAS_NAME_64="wine64"
ALIAS_COMMAND_64="alias $ALIAS_NAME_64='bash $(pwd)/wine64.sh'"

update_alias() {
    local alias_name=$1
    local alias_command=$2

    if grep -q "^alias $alias_name=" "$CONFIG_FILE"; then
        sed -i "s|^alias $alias_name=.*|$alias_command|" "$CONFIG_FILE"
        echo "Alias '$alias_name' updated."
    else
        echo "$alias_command" >> "$CONFIG_FILE"
        echo "Alias '$alias_name' added."
    fi
}

update_alias "$ALIAS_NAME_32" "$ALIAS_COMMAND_32"
update_alias "$ALIAS_NAME_64" "$ALIAS_COMMAND_64"

source "$CONFIG_FILE"
