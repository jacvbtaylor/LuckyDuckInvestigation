#!/bin/bash
#!/usr/bin/zsh
#!/usr/bin/awk -f

printf " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n ***Hello, please enter the numerical hour\n for the time you want to investigate. %s\n"
sleep 2
printf " ***Followed by AM or PM %s\n"
sleep 2
printf " ***The Four digit date\n"
sleep 2
printf " ***And lastly the game.\n"
sleep 2
printf " ***These are the games: \nBlackJack\nRoullette\nTexasHoldEm\n\n\n"
printf “\nExample: \n8 AM 0310 BlackJack\n\n [!!]This is case sensitive.\n\n\n~#”

read TIME PAM DATE GAME

echo “~~~~~~~~~~~~~~~~~~~~~~~”

if [[ $GAME == BlackJack ]]; then
awk -f script.awk ${DATE}* | grep -e ${TIME} | grep -e ${PAM} ; fi

if [[ $GAME == Roulette ]]; then
awk -f script1.awk ${DATE}* | grep -e ${TIME} | grep -e ${PAM} ; fi

if [[ $GAME == TexasHoldEm ]]; then
awk -f script2.awk ${DATE}* | grep -e ${TIME} | grep -e ${PAM} ; fi

echo “~~~~~~~~~~~~~~~~~~~~~~~”
