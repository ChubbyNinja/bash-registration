#!/bin/bash

echo -ne 'Please register..\n'
echo -ne 'Fill in your name, press RETURN on the letter to select it:\n'

i=1
name=''
addAnother=1
alphabet=({a..z})

function loopAlphabet
{
  i=0
  while [ $i -le ${#alphabet[@]} ]
  do

    echo -ne " ${alphabet[i]^}                  \r"


    read -t 0.3 userInput

    if [ $? == 0 ]
    then

      read -p "You selected the letter: ${alphabet[i]^}, is that correct? (YES)  " answer

      answer=${answer^^}
      if [ "$answer" != "NO" ]
      then
        name=${name}${alphabet[i]}
        return
      fi
    fi

    i=$(( i+1 ))

    if [ $i -gt ${#alphabet[@]}  ]
    then
      echo -ne "                  \r"
      i=0
    fi
  done
}

function askForInput
{
  read -p "Would you like to add another letter? (YES)  " answer
  answer=${answer^^}
  if [ "$answer" == "NO" ]
  then
    addAnother=0
  fi
  return

}

while [ "$addAnother" -eq 1 ]
do
  loopAlphabet
  askForInput

done

echo "Hi, "${name^}
echo
echo "Please wait while we register your account"
echo
echo "Please enter your email address: "


numbers=( 0 1 2 3 4 5 6 7 8 9 "@" "." ".com" ".co.uk" ".org" ".io" )

alphabet=( "${alphabet[@]}" "${numbers[@]}" )

addAnother=1
while [ "$addAnother" -eq 1 ]
do
  loopAlphabet
  askForInput

done
