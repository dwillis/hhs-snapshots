today=$(date +%Y%m%d)
sql2csv --db mysql://${DB_USER}:${DB_PASS}@${DB_HOST}/${DB_NAME} --query "select * from stats_team_box_rollup_values_with_names where rollup like \"2023-ncaa%-natl\"" > "data/team_totals_${today}.csv"
sql2csv --db mysql://${DB_USER}:${DB_PASS}@${DB_HOST}/${DB_NAME} --query "select * from stats_player_box_rollup_values_with_names where rollup like \"2023-ncaa%-natl\"" > "data/player_totals_${today}.csv"
sql2csv --db mysql://${DB_USER}:${DB_PASS}@${DB_HOST}/${DB_NAME} --query "select * from stats_game_box_player_with_names where end_year = 2023 and league = 'NCAA'" > "data/player_gameboxes_${today}.csv"
