workout01-SeungHugh-Jeong
================
SeungHugh Jeong
2019 3 10

### Shot Data of 5 NBA players in Golden State Warriors

It is common things that judging NBA players (or even other sports) on very vague criteria, rahter than this player on what they are good at. Or just refer tables which can be shown by searching online and simply check them with only numerical records not with viualization them, and go on to "Oh, this is it". Of course, it may be enough with simply the above data for those who are familiar with or havae been interested in basketball for a long time, but including me, it has no meaning for those who cannot understand or don't know anything about it. So, in this article, five NBA players (especially the Golden State Warriors) were analyzed and visualized.

------------------------------------------------------------------------

    ##   X             team_name game_date season period minutes_remaining
    ## 1 1 Golden State Warriors   3/24/17   2016      3                 2
    ## 2 2 Golden State Warriors   11/3/16   2016      2                10
    ## 3 3 Golden State Warriors  10/25/16   2016      2                 0
    ## 4 4 Golden State Warriors   11/3/16   2016      2                11
    ## 5 5 Golden State Warriors    1/8/17   2016      4                 0
    ## 6 6 Golden State Warriors   3/16/17   2016      3                 5
    ##   seconds_remaining shot_made_flag          action_type      shot_type
    ## 1                35        shot_no  Alley Oop Dunk Shot 2PT Field Goal
    ## 2                51        shot_no  Alley Oop Dunk Shot 2PT Field Goal
    ## 3                 6       shot_yes  Alley Oop Dunk Shot 2PT Field Goal
    ## 4                10        shot_no Alley Oop Layup shot 2PT Field Goal
    ## 5                32       shot_yes    Cutting Dunk Shot 2PT Field Goal
    ## 6                30       shot_yes    Cutting Dunk Shot 2PT Field Goal
    ##   shot_distance              opponent   x  y           name minute
    ## 1             0      Sacramento Kings   0  1 Andre Iguodala     34
    ## 2             1 Oklahoma City Thunder -12 13 Andre Iguodala     14
    ## 3             0     San Antonio Spurs   0  1 Andre Iguodala     24
    ## 4             1 Oklahoma City Thunder  -1 11 Andre Iguodala     13
    ## 5             0      Sacramento Kings   0  1 Andre Iguodala     48
    ## 6             0         Orlando Magic   0  1 Andre Iguodala     31

The table above extracted the first six lines of the raw data. The number of rows in this table is 4,344 lines, and the number of columns is 16. If it is possible to extract the information reader can get from the data and look at this ridiculous amount of data, focus at once, then he (or she) is definitely a genius. So, let's organize the data from now on, with the raw data being unknown.

------------------------------------------------------------------------

    ##  [1] "X"                 "team_name"         "game_date"        
    ##  [4] "season"            "period"            "minutes_remaining"
    ##  [7] "seconds_remaining" "shot_made_flag"    "action_type"      
    ## [10] "shot_type"         "shot_distance"     "opponent"         
    ## [13] "x"                 "y"                 "name"             
    ## [16] "minute"

The above list is the column titles of the original data. What is required is ('name': name of the players, 'shot\_made\_flag': the success or failure of the shooting, 'x', 'y': the location where the show was attempted). Now let's look at the chart below, with the columns which are selected.

           

------------------------------------------------------------------------

> Visualization

Below are charts of the shooting positions and success/failure of the five players in half-court. <img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" /> What can be understood at once, compared to the above chart and the first six-line data extracted? Of course, it's a visualized chart. But, there are a few problems here. There are so many shooting numbers which can be seen a lot of dots on the above each chart with half-court image. And there are also ambiguities to tell which shoot is a two-pointer and which shot is a three-pointer. Lastly, it's also hard to tell which player scored more in the comparison between the five players. So, let's have a rough understanding with the chart above, and separately analyze the data in a little more detail.

------------------------------------------------------------------------

> Comparison

Now to compare the score points between the players, let's pick from the columns which first identified ('name': player's name, 'shot\_type': point of the shot, 'shot\_made\_flag': success or failure of the shot). Below is a table showing the success or failure of the 2-point shot and the success rate (%) determined by the columns picked.

    ## 2PT Effective Shooting % by Player

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <dbl> <dbl>     <dbl>
    ## 1 Andre Iguodala   420   268      63.8
    ## 2 Kevin Durant    1286   780      60.7
    ## 3 Stephen Curry   1126   608      54.0
    ## 4 Klay Thompson   1280   658      51.4
    ## 5 Draymond Green   692   342      49.4

At this 2-point table, Andre Iguodala's sucess rate of 63.8%, widening tha gap between Draymond Green and more than 14%, showing a fairly high gap even though he has loweset number of shooting trial among them.

------------------------------------------------------------------------

Below is a table showing the success or failure of the 3-point shot and the success rate (%) determined by the columns picked.

    ## 3PT Effective Shooting % by Player

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <dbl> <dbl>     <dbl>
    ## 1 Klay Thompson   1740   738      42.4
    ## 2 Stephen Curry   2061   840      40.8
    ## 3 Kevin Durant     816   315      38.6
    ## 4 Andre Iguodala   483   174      36.0
    ## 5 Draymond Green   696   222      31.9

At this 3-point table, Draymond Green is also the lowest with 31.9% success rate, but Andre Iguodala is also only last with 36% success rate. And it's the highest success rate of Klay Thompson, but his success rate is 42.4%, lower than the 49.4% of the Draymond Green with the lowest success rate in the 2-point table. That is, a 3-point shot can be seen to have a definitely higher level of difficulty than a 2-point shot.

------------------------------------------------------------------------

This time, let's take a look at the total score table, which combines the two tables.

    ## Effective Shooting % by Player

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <dbl> <dbl>     <dbl>
    ## 1 Kevin Durant    2102  1095      52.1
    ## 2 Andre Iguodala   903   442      48.9
    ## 3 Klay Thompson   3020  1396      46.2
    ## 4 Stephen Curry   3187  1448      45.4
    ## 5 Draymond Green  1388   564      40.6

Draymond Green, who came in last at both tables, is of course the lowest at the total score table. And all four other players, except Kevin Durant, have not exceeded the 50% success rate.

------------------------------------------------------------------------

> Conclusion

Visualization of the data showed to get a good idea at once. Which player tried many times, how successful and so on. And for detailed information, set and created tables for each 2-point, 3-point, total. Through those three tables, it was possible to analyze the data for comparison between five players, who did well and had more trials and so on. As a result, Kevin Durant has highest success rate of overall shooting even it's higher than 50%, and in 3-point shoot, Klay Thompson has highest one and 2nd highest shooting trial. Thus Overall, it's Durant, but Thompson stands out at three-point distance.
