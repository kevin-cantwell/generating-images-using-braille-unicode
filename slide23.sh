center <<EOF
how about full video:

ffmpeg -ss 130 -re -i ~/Downloads/Harmy\ Star\ Wars\ 4.mkv -f mjpeg -loglevel error pipe:1 | dotmatrix -i --motion -c 25
EOF
