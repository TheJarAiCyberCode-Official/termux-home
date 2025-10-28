#!/bin/bash

## --- ALIAS DASAR DAN SYSTEM ---
# Untuk melihat daftar alias, ketik 'alias' di terminal.

alias clear="reset -Q" # Membersihkan layar dan me-reset state terminal (untuk mengatasi glitch tampilan/warna).
alias ll="ls -l --all --human-readable --classify"
alias cls="clear" # Alias singkat untuk 'clear' (yang sudah di-reset-Q).
alias upg="pkg update && pkg upgrade".
alias py="python"

## --- ALIAS UNTUK VERSION CONTROL (GIT) ---

alias gcln="git clone"
alias gadd="git add --verbose"
alias gbrnch="git branch"
alias gsts="git status"
alias gpsh="git push"
alias gcmt="git commit"
alias gcnf="git config"

## --- ALIAS UNTUK EDIT FILE KONFIGURASI PENTING ---
# Memudahkan akses cepat untuk mengedit file konfigurasi utama.

alias edit-nanorc="nano $HOME/.nanorc" # Edit file konfigurasi editor Nano.
alias edit-bashrc="nano $HOME/.bashrc"
alias edit-profile="nano $HOME/.profile"
alias edit-motdsh="nano $HOME/.termux/motd.sh" # Edit Message of the Day (Pesan saat Termux dibuka).
alias edit-bashaliases="nano $HOME/.bash_aliases"

## --- ALIAS UNTUK PYTHON VIRTUAL ENVIRONMENT (VENV) ---
# Memudahkan manajemen lingkungan terisolasi untuk pengembangan.

alias mkvenv="python -m venv venv && source venv/bin/activate" # Buat dan aktifkan Venv.
alias go="source venv/bin/activate" # Aktifkan Venv yang sudah ada.
alias bye="deactivate" # Keluar/menonaktifkan Venv.

## --- ALIAS UNTUK MAINTENANCE (RESET SETUP) ---
# Digunakan untuk reset setup awal direktori kerja user yang diatur di ~/.profile.

alias resetuserdir="rm $HOME/.termux/.initialized && source $HOME/.profile"
