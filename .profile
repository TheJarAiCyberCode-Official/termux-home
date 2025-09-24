# ~/.profile - Konfigurasi Termux

# Definisi lokasi file indikator
export INITIALIZED_FILE="$HOME/.termux/.initialized"

# Username default sistem
USERNAME="$(whoami)"

# Tambahkan direktori bin milik user ke PATH agar setiap script yang disimpan
# di folder ~/bin akan bisa dijalankan hanya dengan mengetik namanya saja di terminal.
mkdir --parent $HOME/bin
export PATH="$HOME/bin:$PATH"

# Cek apakah file indikator sudah ada. Jika belum, jalankan setup.
if [ ! -f "$INITIALIZED_FILE" ]; then

    echo "Ini adalah setup pertama user direktori. Silakan masukkan nama direktori user Anda."
    echo -e "Kosongkan lalu tekan enter, jika ingin menggunakan username sistem: ${USERNAME}\n"
    # Minta input nama direktori dari pengguna
    read -p "Masukkan nama direktori user (contoh: MyCoolProject): " USERDIR_NAME

    # Cek apakah input kosong. Jika kosong, gunakan nama default.
    if [ -z "$USERDIR_NAME" ]; then
        USERDIR_NAME="$(whoami)"
    fi

    echo "Membuat direktori user: ${USERDIR_NAME}"

    # Buat path lengkap untuk direktori user
    USER_PATH="$HOME/$USERDIR_NAME"
    # Ubah direktori default saat pertama kali terminal dibuka
    mkdir --parents "$USER_PATH"
    cd "$USER_PATH"

    # Buat file indikator agar script tidak dijalankan lagi
    touch "$INITIALIZED_FILE"

    # Simpan NAMA direktori user ke file agar bisa diakses di sesi lain
    echo "$USERDIR_NAME" > "$HOME/.termux/.userdir"

    echo "Setup selesai. Termux siap digunakan!"
    echo "-------------------------------------"

fi

# Ambil nama direktori dari file, lalu pindah ke direktori yang telah dibuat user
if [ -f "$HOME/.termux/.userdir" ]; then
    USERDIR=$(cat "$HOME/.termux/.userdir")
    export USERDIR="$HOME/${USERDIR}"

    # Cek apakah direktori user masih ada
    if [ ! -d "$USERDIR" ]; then
        echo -e "\e[1;31mDirektori user '$USERDIR' \ntidak ditemukan atau sudah diubah.\e[0m"
        echo -e "\nUntuk mereset ulang setup direktori user jalankan perintah '\e[30;47mresetuserdir\e[0m'\nLalu keluar dan buka ulang sesi terminal yang baru"
    fi

    # Pindah ke direktori user
    cd "$USERDIR"
fi
