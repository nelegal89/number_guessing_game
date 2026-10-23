#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDNUM=$(( RANDOM%1001 + 1 ))

echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

ATTEMPTS=0
echo "Guess the secret number between 1 and 1000:"

GUESS_MENU(){
  ATTEMPTS=$(( $ATTEMPTS + 1 ))
  if [[ $1 ]]
  then
    echo $1
  fi
  read GUESS
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS -eq $RANDNUM ]]
    then
      echo "You guessed it in $ATTEMPTS tries. The secret number was $RANDNUM. Nice job!"
      UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=games_played+1 WHERE username='$USERNAME'")
      if [[ $BEST_GAME -eq 0 || $BEST_GAME -gt $ATTEMPTS ]]
      then
        UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$ATTEMPTS WHERE username='$USERNAME'")
      fi
    elif [[ $GUESS -lt $RANDNUM ]]
    then
      GUESS_MENU "It's higher than that, guess again:"
    else     
      GUESS_MENU "It's lower than that, guess again:"
    fi
  else
    GUESS_MENU "That is not an integer, guess again:"
  fi
  exit 0
}

GUESS_MENU
