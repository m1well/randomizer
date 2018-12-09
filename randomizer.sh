#!/bin/bash
###
#title                  :randomizer.sh
#description            :This script randomly picks an option for you.
#author                 :Michael Wellner (@m1well) twitter.m1well.de
#date of creation       :20181209
#date of last change    :20181209
#version                :1.0.0
#usage                  :randomizer.sh
#notes                  :it would be most suitable to create an alias
###

### colors and linebreak ###
BR="\n"
FONT_CYAN="\033[0;96m"
FONT_GREEN="\033[0;92m"
FONT_NONE="\033[0m"

### output ###
hashline="##########################################"
header="############### randomizer ###############"

printStartLines() {
  printf "${FONT_CYAN}"
  printf "${hashline}${BR}"
  printf "${header}${BR}"
  printf "${hashline}${BR}"
  printf "${FONT_NONE}"
}
printEndLines() {
  printf "${FONT_CYAN}"
  printf "${hashline}${BR}"
  printf "${FONT_NONE}"
}

isStringEqual() {
   if [ "${1}" == "${2}" ] ; then return 0 ; fi
   return 1
}

### start of script ###
printStartLines

counter=0
while read line
do
  if !(isStringEqual "$line" "") ; then
    options=${options}${line},
    ((counter++))
  else
    break
  fi
done

random=$(cat /dev/urandom | env LC_CTYPE=C tr -cd "1-${counter}" | head -c 1)

win=$(echo ${options} | cut -d "," -f ${random})

printf "${FONT_GREEN}and the randomized winner is:${BR}${FONT_NONE}"

sleep 3

printf "${FONT_GREEN}>>> ${win} <<< ${BR}${FONT_NONE}"

printEndLines

### end of script ###
#####################
