#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup"

$($PSQL "TRUNCATE TABLE games, teams;")
$($PSQL "INSERT INTO teams (name) VALUES ('Team1'), ('Team2'), ... ;")
while IFS=, read -r year round winner opponent winner_goals opponent_goals; do
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner';")
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent';")

    $($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$year', '$round', '$winner_id', '$opponent_id', '$winner_goals', '$opponent_goals');")
done < games.csv
