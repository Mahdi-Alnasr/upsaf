#!/bin/bash

start_time=$(date +'%H:%M:%S')
current_date=$(date +'%Y-%m-%d')

sudo cachyos-rate-mirrors

paru -Syu --noconfirm

flatpak update -y

datetime="${current_date}T${start_time}"

paclog --action=upgrade | awk -v target="$datetime" 'substr($1, 2, 19) >= target'

flatpak history --since="$current_date $start_time"
