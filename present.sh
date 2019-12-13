#!/usr/bin/env bash

# centers text vertically
function vcenter {
    text="${1:-$(</dev/stdin)}"

    rows=$(expr $(tput lines) - 1)

    text_length=`echo -e "$text" | wc -l`

    total_padding=$(expr $rows - $text_length)

    if [ $((total_padding%2)) -eq 1 ]; then
        padtop=$(expr  $(expr $total_padding + 1)  / 2)
    else
        padtop=$(expr  $total_padding  / 2)
    fi

    padbot=$(expr  $total_padding  / 2)

    above=""
    below=""

    for ((i=1; i < $padtop; i++)) {
        above+="\n"
    }

    for ((i=0; i < $padbot; i++)) {
        below+="\n"
    }

    echo -e "$above$text$below"
}

function hcenter {
    echo "${1:-$(</dev/stdin)}" | /usr/bin/fmt -c -s -w `tput cols`
}

function center {
    echo "${1:-$(</dev/stdin)}" | hcenter | vcenter
}

hr() {
  local start=$'\e(0' end=$'\e(B' line='qqqqqqqqqqqqqqqq'
  local cols=${COLUMNS:-$(tput cols)}
  while ((${#line} < cols)); do line+="$line"; done
  printf '%s%s%s\n' "$start" "${line:0:cols}" "$end"
}

next() {
    read -t 5
    kill %1 >> /dev/null 2>&1
    hr
    clear
}

for slide in ./slide*; do 
    echo
    source $slide
    next
done