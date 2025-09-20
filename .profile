# ~/.profile - Konfigurasi Termux

# Definisi lokasi file indikator
INITIALIZED_FILE="$HOME/.termux/.initialized"

# Username default sistem
USERNAME="$(whoami)"

# Tambahkan direktori bin milik user ke PATH agar setiap script yang disimpan
# di folder ~/bin akan bisa dijalankan hanya dengan mengetik namanya saja di terminal.
mkdir --parent $HOME/bin
export PATH="$HOME/bin:$PATH"

# Cek apakah file indikator sudah ada. Jika belum, jalankan setup.
if [ ! -f "$INITIALIZED_FILE" ]; then

    echo "Ini adalah setup pertama. Silakan masukkan nama direktori user Anda."
    echo -e "Kosongkan lalu tekan enter, jika ingin menggunakan username sistem: ${USERNAME}\n"
    # Minta input nama direktori dari pengguna
    read -p "Masukkan nama direktori user (contoh: MyCoolProject): " USR_DIR_NAME

    # Cek apakah input kosong. Jika kosong, gunakan nama default.
    if [ -z "$USR_DIR_NAME" ]; then
        USR_DIR_NAME="$(whoami)"
    fi

    echo "Membuat direktori user: ${USR_DIR_NAME}"

    # Ubah direktori default saat pertama kali terminal dibuka
    USER_PATH="$HOME/${USR_DIR_NAME}"
    mkdir --parents "$USER_PATH"
    cd "$USER_PATH"

    # Buat file indikator agar script tidak dijalankan lagi
    touch "$INITIALIZED_FILE"

    # Simpan nama direktori user ke file agar bisa diakses di sesi lain
    echo "$USR_DIR_NAME" > "$HOME/.termux/.usr_dir_name"

    echo "Setup selesai. Termux siap digunakan!"
    echo "-------------------------------------"

fi

# Ambil nama direktori dari file, lalu pindah ke direktori yang telah dibuat user
if [ -f "$HOME/.termux/.usr_dir_name" ]; then
    USER_DIR_NAME=$(cat "$HOME/.termux/.usr_dir_name")
    cd "$HOME/$USER_DIR_NAME"
fi
