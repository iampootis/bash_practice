#!/bin/bash

function add_user() {
  useradd -G ["group_1", "group_2"] -d $2 -p $(openssl passwd $3) $4  # Groups, home_dir, password's hash, user_name
}

function split_users() {
  IFS=";" read -a myarray <<< $1
  echo "Groups: ${myarray[0]}"
  echo "Password: ${myarray[1]}"
  echo "Name: ${myarray[2]}"
}

function split_groups() {

}

split_users "$@"