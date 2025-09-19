# Membuat nama direktori user default, ubah nama sesuai keinginan
USR_DIR_NAME="TheJarAiCyberCode"

# Ubah direktori default saat pertama kali terminal dibuka
# Pastikan direktori ada sebelum masuk.
mkdir -p "/data/data/com.termux/files/home/user/${USR_DIR_NAME}"
cd "/data/data/com.termux/files/home/user/${USR_DIR_NAME}"

# Tambahkan direktori bin milik user ke PATH agar setiap script yang disimpan
# di folder ~/bin akan bisa dijalankan hanya dengan mengetik namanya saja di terminal.
export PATH="/data/data/com.termux/files/home/user/bin:$PATH"
