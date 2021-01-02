#!/usr/bin/env bash

echo "export PATH=/home/agucova/.nimble/bin:$PATH" > .bashrc
fish -c "set --universal fish_user_paths \$fish_user_paths ~/.nimble/bin"
