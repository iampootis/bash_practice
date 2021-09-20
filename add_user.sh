#!/bin/bash


function add_user() {
  sudo useradd -G "$1" -d "$2" -p "$(openssl passwd "$3")" "$4"  # Groups, home_dir, password's hash, user_name
}

for user_info in "$@"; do
  IFS=";" read -a myarray <<< $user_info
  echo "Groups: ${myarray[0]}"
  user_groups=${myarray[0]}
  echo "User's home directory: ${myarray[1]}"
  user_homedir="${myarray[1]}"
  echo "Password: ${myarray[2]}"
  user_password="${myarray[2]}"
  echo "Name: ${myarray[3]}"
  user_name="${myarray[3]}"
  printf "\n"

  add_user "$user_groups" "$user_homedir$user_name" "$user_password" "$user_name"
done
