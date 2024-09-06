#!/bin/bash
#
# Simple password generator
# This script generates a new password based on date comand (nanoseconds and seconds since the Epoch formats) and sha256 hash.
# You will be prompted to enter the password lenght the user need.
# The generated password will be displayed at the end.

echo "
._  _. _ _     _ .__|  _  _ ._  _ .__._|_ _ ._
|_)(_|_>_>\/\/(_)|(_| (_|(/_| |(/_|(_| |_(_)|
|                      _|"
echo ""
echo "Password Generator v.1 7uc4"
echo ""

#Get the lenght of the password
echo "Please enter the lenght of the password you need:"
read PASS_LENGTH

# Validate if input is a number
if ! [[ "$PASS_LENGTH" =~ ^[0-9]+$ ]]
then
  echo "Please enter a valid number."
  exit 1
fi

# Ensure password length is greater than 0
if [ "$PASS_LENGTH" -le 0 ]
then
 echo "Password length must be greater than zero."
  exit 1
fi

PASSWORD_SEED=$(date +%s%N | sha256sum | head -c${PASS_LENGTH})
SPECIAL_CHARS="#%^&()_="
PASSWORD="${PASSWORD_SEED}${SPECIAL_CHARS}"
PASSWORD=$(echo "$PASSWORD" | fold -w1 | shuf | tr -d '\n' | head -c${PASS_LENGTH})

# Display the password
echo ""
echo "Generated password: ${PASSWORD}"
echo ""
exit 0