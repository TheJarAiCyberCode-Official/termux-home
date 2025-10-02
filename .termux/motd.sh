#!/data/data/com.termux/files/usr/bin/bash

# --- BAGIAN PENGATURAN AWAL ---
# Memastikan package manager Termux terpasang dengan benar.
source "/data/data/com.termux/files/usr/bin/termux-setup-package-manager" || exit 1

# --- BAGIAN PESAN UTAMA ---
# Pesan Selamat Datang (Welcome Message)
# Memulai variabel motd dengan pesan selamat datang.
motd="
\e[30;47mSelamat Datang di Termux!\e[0m
\e[1mDokumentasi:\e[0m \e[4mhttps://termux.dev/docs\e[0m
\e[1mDonasi:\e[0m      \e[4mhttps://termux.dev/donate\e[0m
\e[1mKomunitas:\e[0m   \e[4mhttps://termux.dev/community\e[0m
"

# --- BAGIAN INFORMASI PENTING ---
# Menambahkan Informasi Paket (Package Information)
# Menambahkan baris baru ke variabel motd yang sudah ada.
motd+="
\e[30;47mBekerja dengan paket:\e[0m
\e[1mMencari:\e[0m  pkg search <query>
\e[1mMemasang:\e[0m pkg install <package>
\e[1mMeningkatkan:\e[0m pkg upgrade
"

# --- BAGIAN REPOSITORI (KHUSUS APT) ---
# Tampilan ini hanya muncul jika package manager yang digunakan adalah APT.
# Memeriksa apakah package manager yang digunakan adalah apt.
# Jika ya, tambahkan informasi repo tambahan.
if [ "$TERMUX_APP_PACKAGE_MANAGER" = "apt" ]; then

    motd+="
\e[30;47mBerlangganan repo tambahan:\e[0m
\e[1mRoot:\e[0m pkg install root-repo
\e[1mX11:\e[0m  pkg install x11-repo

Untuk memperbaiki masalah repositori apa pun,
coba perintah '\e[30;47mtermux-change-repo\e[0m'.

"
fi

# --- BAGIAN PELAPORAN ISU ---
# Bagian ini juga selalu ditambahkan di bagian akhir.
motd+="Laporkan masalah di \e[4mhttps://termux.dev/issues\e[0m
"

# --- TAMPILKAN MOTD ---
# Menampilkan semua pesan yang sudah digabungkan.
echo -e "$motd"
