today=$(date +%Y%m%d)
sql2csv --db mysql://${DB_USER}:${DB_PASS}@${DB_HOST}/${DB_NAME} --query "select * from stats_team_box_rollup_values_with_names where rollup like \"2023-ncaa%-natl\"" > "data/team_totals_${today}.csv"
sql2csv --db mysql://${DB_USER}:${DB_PASS}@${DB_HOST}/${DB_NAME} --query "select * from stats_player_box_rollup_values_with_names where rollup like \"2023-ncaa%-natl\"" > "data/player_totals_${today}.csv"
sql2csv --db mysql://${DB_USER}:${DB_PASS}@${DB_HOST}/${DB_NAME} --query "select * from stats_game_box_player_with_names where end_year = 2023 and league = 'NCAA'" > "data/player_gameboxes_${today}.csv"
sql2csv --db mysql://${DB_USER}:${DB_PASS}@${DB_HOST}/${DB_NAME} --query "select * from stats_game_box_team_total where source = 'ncaa' and hhs_game_id_text IN (select hhs_game_id_text from game where league = 'NCAA' and end_year = 2023 order by gamedate_east desc)" > "data/team_gameboxes_${today}.csv"
sql2csv --db mysql://${DB_USER}:${DB_PASS}@${DB_HOST}/${DB_NAME} --query "select * from stats_team_box_rollup_ranks" > "data/team_ranks_${today}.csv"
sql2csv --db mysql://${DB_USER}:${DB_PASS}@${DB_HOST}/${DB_NAME} --query "select hhs_game_id_text, home_team_id_text, away_team_id_text, gamedate_east, gametime_east, league, end_year, season_type, status_boxscore, neutral_site, neutral_site_text, ncaa_game_id from game where league = 'NCAA' and end_year = 2023" > "data/games_2023_${today}.csv"
sql2csv --db mysql://${DB_USER}:${DB_PASS}@${DB_HOST}/${DB_NAME} --query "select hhs_person_id_text, hhs_team_id_text, league, end_year, season_num, role from person_season where league = 'NCAA' and end_year = '2023' and role = 'player'" > "data/player_seasons_${today}.csv"
