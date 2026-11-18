# Number Guessing Game

A command-line number guessing game built with Bash and PostgreSQL. Players try to guess a randomly generated number between 1 and 1000, while their game statistics, such as best game or total games played, are stored in a database.

## Technologies
- Bash
- PostgreSQL
- SQL

## Features
- Generate a random number for each game.
- Provide hints when a guess is too high or too low.
- Register players by username.
- Track games played and personal best scores.
- Store and update player statistics in PostgreSQL.

## Database Structure

The database contains one table:

- **users** – stores usernames, games played, and best game scores.

## Usage
Run the game:

```bash
./number_guess.sh
```

**Note:** PostgreSQL must be running, and the database must be configured before launching the script. The scripts currently use the PostgreSQL role `freecodecamp`.
