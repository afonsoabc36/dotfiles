#!/bin/bash

sudo apt update && sudo apt upgrade -y

xargs sudo apt install -y < packages-list.txt
