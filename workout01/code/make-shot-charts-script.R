#title: Players' data's chart
#description: R code for plotting players' goal data
#input: shots-data.csv
#output: andre-iguodala-shot-chart.pdf, draymond-green-shot-chart.pdf, kevin-durant-shot-chart.pdf, klay-thompson-shot-chart.pdf, stephen-curry-shot-chart.pdf, gsw-shot-charts.pdf, gsw-shot-charts.png

install.packages("jpeg")
library(jpeg)
library(grid)
library(ggplot2)

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))
total <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)

pdf("../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = total[total$name == "Andre Iguodala", ]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle("Shot Chart: Andre Iguodala (2016 season)") + 
  theme_minimal()
dev.off()

pdf("../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = total[total$name == "Draymond Green", ]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle("Shot Chart: Draymond Green (2016 season)") + 
  theme_minimal()
dev.off()

pdf("../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = total[total$name == "Kevin Durant", ]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle("Shot Chart: Kevin Durant (2016 season)") + 
  theme_minimal()
dev.off()

pdf("../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = total[total$name == "Klay Thompson", ]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle("Shot Chart: Klay Thompson (2016 season)") + 
  theme_minimal()
dev.off()

pdf("../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = total[total$name == "Stephen Curry", ]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle("Shot Chart: Stephen Curry (2016 season)") + 
  theme_minimal()
dev.off()


pdf("../images/gsw-shot-charts.pdf", width = 8, height = 7)
ggplot(data = total) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle("Shot Chart: GSW (2016 season)") + 
  facet_wrap(~ name) + 
  theme_minimal() + 
  theme(legend.position = "top", legend.title = element_blank())
dev.off()

png("../images/gsw-shot-charts.png", width = 8, height = 7, units = "in", res = 1200)
ggplot(data = total) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle("Shot Chart: GSW (2016 season)") + 
  facet_wrap(~ name) + 
  theme_minimal() +
  theme(legend.position = "top", legend.title = element_blank())
dev.off()
