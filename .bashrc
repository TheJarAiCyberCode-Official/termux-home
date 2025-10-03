# ============================================================================================= #
# FILE: ~/.bashrc - Konfigurasi Bash Shell untuk Termux
# DESKRIPSI: Berisi pengaturan prompt (PS1), variabel, dan daftar alias yang disesuaikan.
# ============================================================================================= #

PROMPT_DIRTRIM=2

## --- KUSTOMISASI PROMPT TERMINAL (PS1) ---
# Mengubah kustomisasi tampilan prompt terminal PS1:
# - Menampilkan Titlebar (judul jendela/tab).
# - Working Directory (Cyan Bold), dan Tanda $ (Kuning).

export PS1="\[\e]0;\u@\h:\w\\a\]\[\e[1;36m\]\w\[\e[0m\] \[\e[1;33m\]\$ \[\e[0m\]"

# ============================================================================================= #

## --- ALIAS DASAR DAN SYSTEM ---
# Untuk melihat daftar alias, ketik 'alias' di terminal.

alias clear="reset -Q" # Membersihkan layar dan me-reset state terminal (untuk mengatasi glitch tampilan/warna).
alias ll="ls -alhF" # Listing file dengan detail, ukuran mudah dibaca, dan penanda tipe file.
alias cls="clear" # Alias singkat untuk 'clear' (yang sudah di-reset-Q).
alias upg="pkg update && pkg upgrade" # Update dan upgrade semua paket Termux.
alias py="python" # Alias singkat untuk pemanggilan Python.

## --- ALIAS UNTUK VERSION CONTROL (GIT) ---

alias gdd="git add" # Tambahkan file
alias gcln="git clone" # Clone repository.
alias gsts="git status" # Cek status perubahan file.
alias gpsh="git push" # Push perubahan ke remote repository.
alias gcmt="git commit" # Commit perubahan (biasanya diikuti -m "message").
alias gcnf="git config" # Konfigurasi Git.

## --- ALIAS UNTUK EDIT FILE KONFIGURASI PENTING ---
# Memudahkan akses cepat untuk mengedit file konfigurasi utama.

alias editnanorc="nano $HOME/.nanorc" # Edit file konfigurasi editor Nano.
alias editbashrc="nano $HOME/.bashrc" # Edit file ini (bashrc).
alias editprofile="nano $HOME/.profile" # Edit file konfigurasi shell utama.
alias editmotdsh="nano $HOME/.termux/motd.sh" # Edit Message of the Day (Pesan saat Termux dibuka).

## --- ALIAS UNTUK PYTHON VIRTUAL ENVIRONMENT (VENV) ---
# Memudahkan manajemen lingkungan terisolasi untuk pengembangan.

alias mkvenv="python -m venv venv && source venv/bin/activate" # Buat dan aktifkan Venv.
alias go="source venv/bin/activate" # Aktifkan Venv yang sudah ada.
alias bye="deactivate" # Keluar/menonaktifkan Venv.

## --- ALIAS UNTUK MAINTENANCE (RESET SETUP) ---
# Digunakan untuk reset setup awal direktori kerja user yang diatur di ~/.profile.

alias resetuserdir="rm $HOME/.termux/.initialized && source $HOME/.profile"
# ============================================================================================= #
