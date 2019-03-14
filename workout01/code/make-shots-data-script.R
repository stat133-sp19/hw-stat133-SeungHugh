#title: Players' data
#description: R code for analyzing players' data
#input: stephen-curry.csv, andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, klay-thompson.csv
#output: andre-iguodala-summary.txt, draymond-green-summary.txt, kevin-durant-summary.txt, klay-thompson-summary.txt, stephen-curry-summary.txt, shots-data.csv, shots-data-summary.txt   
  
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)

curry$name <- "Stephen Curry"
iguodala$name <- "Andre Iguodala"
green$name <- "Draymond Green"
durant$name <- "Kevin Durant"
thompson$name <- "Klay Thompson"

curry$shot_made_flag[curry$shot_made_flag == 'y'] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- "shot_no"
green$shot_made_flag[green$shot_made_flag == 'y'] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == 'n'] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == 'y'] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- "shot_no"

curry$minute <- (12 * curry$period) - curry$minutes_remaining
iguodala$minute <- (12 * iguodala$period) - iguodala$minutes_remaining
green$minute <- (12 * green$period) - green$minutes_remaining
durant$minute <- (12 * durant$period) - durant$minutes_remaining
thompson$minute <- (12 * thompson$period) - thompson$minutes_remaining

sink("../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink("../output/draymond-green-summary.txt")
summary(green)
sink()

sink("../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink("../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink("../output/stephen-curry-summary.txt")
summary(curry)
sink()

shots_data <- rbind(iguodala, green, durant, thompson, curry)

write.csv(shots_data, "../data/shots-data.csv")

sink("../output/shots-data-summary.txt")
summary(shots_data)
sink()
