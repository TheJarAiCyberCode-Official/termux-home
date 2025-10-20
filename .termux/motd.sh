#!/data/data/com.termux/files/usr/bin/bash

source "/data/data/com.termux/files/usr/bin/termux-setup-package-manager" || exit 1

motd="
\e[30;47mSelamat Datang di Termux!\e[0m
\e[1mDokumentasi:\e[0m \e[4mhttps://termux.dev/docs\e[0m
\e[1mDonasi:\e[0m      \e[4mhttps://termux.dev/donate\e[0m
\e[1mKomunitas:\e[0m   \e[4mhttps://termux.dev/community\e[0m
"

motd+="
\e[30;47mBekerja dengan paket:\e[0m
\e[1mMencari:\e[0m      pkg search <query>
\e[1mMemasang:\e[0m     pkg install <package>
\e[1mMeningkatkan:\e[0m pkg upgrade
"

if [ "$TERMUX_APP_PACKAGE_MANAGER" = "apt" ]; then

    motd+="
\e[30;47mBerlangganan repo tambahan:\e[0m
\e[1mRoot:\e[0m pkg install root-repo
\e[1mX11:\e[0m  pkg install x11-repo
"
fi

motd+="
Untuk memperbaiki masalah repositori apa pun,
jalankan perintah '\e[30;47mtermux-change-repo\e[0m'.

Laporkan masalah di \e[4mhttps://termux.dev/issues\e[0m
"

echo -e "$motd"
