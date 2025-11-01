#!/bin/bash

clear

# --- Pengecekan Dependensi ---
if ! command -v git &> /dev/null || ! command -v rsync &> /dev/null; then
    echo "Memasang paket yang dibutuhkan: git dan rsync..."
    # Memastikan Termux sudah di-update
    pkg update && upgrade -y
    pkg install git rsync -y
    if [ $? -ne 0 ]; then
        echo -e "\e[1;31m Gagal menginstal paket!\e[0m Silakan instal manual atau periksa koneksi internet."
        exit 1
    fi
fi

URL_GIT="https://github.com/TheJarAiCyberCode-Official/termux-home.git"

echo "Mengkloning $URL_GIT ..."
git clone $URL_GIT

# Pengecekan keberhasilan kloning
if [ $? -ne 0 ]; then
    exit 1
fi

echo "Kloning selesai! ✅"
cd termux-home/

# --- Peringatan dan Konfirmasi ---
echo -e "\nMemulai instalasi termux-home..."
echo -e "\e[1;33mPeringatan! Proses instalasi ini akan menimpa file berikut jika ada:\e[0m"
echo '~/.bashrc
~/.bash_aliases
~/.nanorc
~/.profile
~/.termux/motd.sh
~/.termux/termux.properties
~/usr/bin/system-check
~/usr/bin/backup-termux-encrypted'
echo -e "Pastikan anda sudah mencadangkan-nya (backup) sebelum melanjutkan!\n"

read -p "Apakah ingin tetap melanjutkan? (y/n) " ANSWER
# Konversi input ke huruf kecil untuk penanganan 'y' atau 'Y'
ANSWER_LOWER=$(echo "$ANSWER" | tr '[:upper:]' '[:lower:]')

if [ "$ANSWER_LOWER" == "y" ]; then
    echo "Sinkronisasi dijalankan..."
    rsync -arv \
      --exclude='.git' \
      --exclude='images' \
      --exclude='README.md' \
      --exclude='LICENSE' \
      --exclude='install-termux-home.sh' \
      ./ /data/data/com.termux/files/home/

    if [ $? -eq 0 ]; then
        echo -e "\e[1;32mInstalasi selesai! 🎉\e[0m"
        echo "Untuk menerapkan perubahan, silakan keluar ('exit')"
        echo "dan buka kembali sesi termux yang baru."
    else
        echo -e "\e[1;31mSinkronisasi (rsync) gagal!\e[0m Mungkin ada masalah izin (permission)."
    fi

    # Membersihkan direktori setelah instalasi selesai (opsional)
    cd ..
    rm -rf termux-home/
    echo "Direktori 'termux-home/' sementara telah dihapus."

else
    # Memastikan direktori termux-home yang berhasil di clone terhapus saat instalasi di batalkan
    rm -rf termux-home
    echo "Instalasi termux-home dibatalkan."
fi
