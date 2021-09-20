#!/bin/bash


if [ -z "$*" ]
then
echo "No options found!"
exit 1
fi

while getopts "g:h:p:n:" opt; do
case $opt in
g) echo "User groups: $OPTARG"
user_groups="$OPTARG"
;;
h) echo "User's home directory: $OPTARG"
home_dir="$OPTARG"
;;
p) echo "Password entered"
password="$OPTARG"
;;
n) echo "User name: $OPTARG"
user_name="$OPTARG"
;;
*) echo "No reasonable options found!";;
esac
done


function add_user() {
  useradd -G "$1" -d "$2" -p "$(openssl passwd password)" "$4"  # Groups, home_dir, password's hash, user_name
}

# printf "\n$user_groups\n$home_dir\n$password\n$user_name\n"
add_user "$user_groups" "$home_dir" "$password" "$user_name"
