#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup"

# Query 1
echo $($PSQL "SELECT COUNT(*) FROM teams;")

# Query 2
echo $($PSQL "SELECT COUNT(*) FROM games;")

# Query 3
echo $($PSQL "SELECT teams.name, COUNT(*) FROM games JOIN teams ON games.winner_id = teams.team_id GROUP BY teams.name ORDER BY COUNT(*) DESC;")

# Query 4
echo $($PSQL "SELECT AVG(winner_goals) AS average_goals FROM games;")

# Query 5
echo $($PSQL "SELECT year, round, teams.name AS winner, opponent.name AS opponent, winner_goals, opponent_goals FROM games
              JOIN teams ON games.winner_id = teams.team_id
              JOIN teams AS opponent ON games.opponent_id = opponent.team_id
              ORDER BY year, round;")

# Query 6
echo $($PSQL "SELECT round, COUNT(*) FROM games GROUP BY round ORDER BY COUNT(*) DESC, round LIMIT 1;")