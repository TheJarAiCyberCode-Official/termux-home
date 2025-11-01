# --- FUNGSI SETUP DIREKTORI KERJA AWAL ---
initial_setup_working_directory() {
    # Lokasi file indikator: menandakan setup sudah pernah dijalankan.
    local INITIALIZED_FILE="$HOME/.termux/.initialized"
    # Lokasi file penyimpanan nama direktori user.
    local USERDIR_NAME_FILE="$HOME/.termux/.userdir"

    # Cek apakah setup direktori kerja  Sudah Pernah Dijalankan
    if [ ! -f "$INITIALIZED_FILE" ]; then
        echo -e "\e[30;47m SETUP DIREKTORI KERJA USER (Termux) \e[0m"
        echo -e "Ini adalah setup direktori kerja user, \nsilakan masukkan nama direktori kerja Anda."
        echo -e "Jika ingin menggunakan username sistem: $(whoami) \nkosongkan lalu tekan Enter.\n"

        # Minta input nama direktori dari pengguna
        echo "Masukkan nama direktori kerja user (contoh: ProjectSaya):"
        read -p " > " USERDIR_INPUT

        # Cek input. Jika kosong, gunakan username sistem.
        if [ -z "$USERDIR_INPUT" ]; then
            local USERDIR_NAME="$(whoami)"
        else
            local USERDIR_NAME="$USERDIR_INPUT"
        fi

        echo "Membuat direktori user: ${USERDIR_NAME}"

        # Buat path lengkap dan direktori, pastikan direktori induk juga dibuat (-p)
        local USER_PATH="$HOME/$USERDIR_NAME"
        mkdir -p "$USER_PATH"

        # Buat file indikator agar setup tidak dijalankan lagi di sesi berikutnya
        touch "$INITIALIZED_FILE"

        # Simpan NAMA direktori user ke file untuk akses di sesi lain
        echo "$USERDIR_NAME" > "$USERDIR_NAME_FILE"

        echo -e "\e[1;32mSetup Selesai! Termux siap digunakan.\e[0m"
        # menampilkan path lengkap direktori kerja user
        echo "$USER_PATH"
        echo "-------------------------------------"
    fi

    # Setelah setup selesai (atau jika sudah pernah disetup sebelumnya):
    # Ambil nama direktori dari file, definisikan, dan pindah ke direktori tersebut.
    if [ -f "$USERDIR_NAME_FILE" ]; then
        local USERDIR_BASE_NAME=$(cat "$USERDIR_NAME_FILE")
        # Export variabel lingkungan global untuk path direktori kerja user
        export USERDIR="$HOME/${USERDIR_BASE_NAME}"
        cd "$USERDIR"
    fi
}
# Jalankan fungsi setup
initial_setup_working_directory

# --- PENANGANAN ERROR (JIKA DIREKTORI USER HILANG/DIHAPUS) ---
if [ ! -d "$USERDIR" ]; then
    echo -e "\e[1;31mDirektori user '$USERDIR' \ntidak ditemukan atau sudah diubah/dihapus.\e[0m"
    echo -e "Untuk reset ulang setup direktori user, jalankan perintah '\e[1;33mresetuserdir\e[0m'"
    # perintah alias resetuserdir diatur di ~/.bash_aliases
fi

# ============================================================================================= #
