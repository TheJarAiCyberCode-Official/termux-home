
# Kode untuk mereset semua format ke normal
NC='\[\e[0m\]'

# Kode untuk menampilkan tanggal dan waktu di prompt terminal PS1
# contoh tampilan akan seperti ini: Wednesday,17 September 21:27:14 WIB 2025
DATE_TIME='\D{%A,%d %B %H:%M:%S %Z %Y}'

# Mengubah kustomisasi tampilan prompt terminal PS1
export PS1="\[\e]0;\u@\h:\w\\a\]\[\e[2;3;37m\]${DATE_TIME} ${NC}
\[\e[1;31m\]\u@\h:${NC}\[\e[1;32m\]\w${NC} \[\e[1;33m\]\$ ${NC}"

# Membuat kustomisasi alias perintah
# Untuk melihat daftar alias, ketik "alias" di terminal
alias ll="ls -alhF"
alias cls="clear"
alias upg="pkg update && pkg upgrade"
alias py="python"
alias editnanorc="nano /data/data/com.termux/files/home/.nanorc" # ubah file ~/.nanorc
alias editbashrc="nano /data/data/com.termux/files/home/.bashrc" # ubah file ~/.bashrc
alias editprofile="nano /data/data/com.termux/files/home/.profile" # ubah file ~/.profile
alias editmotdsh="nano /data/data/com.termux/files/home/.termux/motd.sh" # ubah file ~/.termux/motd.sh
# Ubah direktori user default /home/USERDIR
alias edituserdir="nano /data/data/com.termux/files/home/.termux/.userdir"
# Reset setup pertama user direktori
alias resetuserdir="rm /data/data/com.termux/files/home/.termux/.initialized"
