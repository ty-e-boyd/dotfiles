#!/bin/bash

tmux new-session -d -s 'resto_dev'
tmux rename-window 'frontend'
tmux send-keys -t resto_dev:frontend 'cd ~/Development/restoration_apparel_company/resto-website' C-m
tmux send-keys -t resto_dev:frontend 'nvim .' C-m
tmux new-window -t 'resto_dev' -n 'backend'
tmux send-keys -t resto_dev:backend 'cd ~/Development/restoration_apparel_company/resto-api' C-m
tmux send-keys -t resto_dev:backend 'nvim .' C-m
tmux new-window -t 'resto_dev' -n 'processes'
tmux select-window -t resto_dev:processes
tmux split-window -h
tmux send-keys -t resto_dev:processes.0 'cd ~/Development/restoration_apparel_company/resto-website' C-m
tmux send-keys -t resto_dev:processes.0 'npm run dev -- --open' C-m
tmux send-keys -t resto_dev:processes.1 'cd ~/Development/restoration_apparel_company/resto-api' C-m
# RUNNING LOCALLY tmux send-keys -t resto_dev:processes.1 'go run main.go' C-m
tmux send-keys -t resto_dev:processes.1 'docker build --platform linux/amd64 -t tylerboydfromrest/resto-api .' C-m
tmux send-keys -t resto_dev:processes.1 'docker run -p 3000:3000 resto-api' C-m
tmux new-window -t 'resto_dev' -n 'vibes-only'
tmux send-keys -t resto_dev:vibes-only 'btop' C-m
tmux select-window -t resto_dev:frontend
tmux attach-session -t 'resto_dev'
