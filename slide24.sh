center <<EOF
how about live video:

ffmpeg -r 30 -f avfoundation -i FaceTime -vf hflip -f mjpeg -loglevel error pipe:1 | dotmatrix -i --motion
EOF