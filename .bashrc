## --- KUSTOMISASI PROMPT TERMINAL (PS1) ---
PROMPT_DIRTRIM=2

# Mengubah kustomisasi tampilan prompt terminal PS1:
export PS1="\[\e]0;\u@\h:\w\\a\]\[\e[1;36m\]\w\[\e[0m\] \[\e[1;33m\]\$ \[\e[0m\]"

# ============================================================================================= #

# --- KONFIGURASI PATH DAN ~/usr/bin ---
# Cek dan buat direktori '~/usr/bin' user jika belum ada.
if [ ! -d "$HOME/usr/bin" ]; then
    mkdir -p "$HOME/usr/bin"
fi

# Tambahkan direktori bin user ke variabel lingkungan PATH.
export PATH="$PATH:$HOME/usr/bin"

# Skrip yang disimpan di '~/usr/bin' akan bisa dijalankan langsung dari terminal,
# dengan hanya mengetik nama skrip-nya saja

# ============================================================================================= #

if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi

export GPG_TTY=$(tty)
