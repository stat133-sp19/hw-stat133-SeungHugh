team_name: Character "Golden State Warriors"
           names of NBA team

game_date:  M/D/Y
            data of a match occurred

period:  Integer (>1)
          an NBA game is divided in 4 periods of 12 mins each. For example, a value for period           = 1 refers to the first period (the first 12 mins of the game)

minutes_reamaining & seconds_remaining: Integer (0< & <60)
                                        they have to do with the amount of time in minutes and                                         seconds, respectively, that remained to be played in a                                         given period.

shot_made_flag: Character 'y' | 'n'
                it indicates whether a shot was made (y) or missed (n).

action_type: Character "Shot type"
            it has to do with the basketball moves used by players, either to pass by                     defenders to gain access to the basket, or to get a clean pass to a teammate to               score a two pointer or three pointer.

shot_type:  Character "XPT Field Goal" (need to convert to integer)
            it indicates whether a shot is a 2-point field goal, or a 3-point field goal.

shot_distance:  Integer (>=0)
                distance to the basket (measured in feet).

opponent: Character "opposite team name"

x & y:  Integer (x, y) coord
        they refer to the court coordinates (measured in inches) where a shot occurred.

