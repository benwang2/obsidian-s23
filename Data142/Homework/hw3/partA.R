imdb = read.csv("./Movies2022F-4.csv")

#
#   Country x IMDB Score
#

par(mar=c(8,5,2,2))
country_colors = rainbow(52)
boxplot(imdb$imdb_score ~ imdb$country, 
    xlab = "", 
    ylab = "IMDB Score",
    main = "IMDB Score vs Country",
    col = country_colors,
    las = 2,
    names.arg = abbreviate(imdb$country)
)

country_means <- aggregate(imdb_score ~ country, imdb, mean)
overall_mean <- mean(imdb$imdb_score)
country_diffs <- country_means$imdb - overall_mean

barplot(country_diffs, col = country_colors, xlab = "Country", ylab = "Difference from Overall Mean",
        main = "Mean IMDB Score Difference by Country", names.arg = country_means$country, las=2)


# Rating x Score
boxplot(imdb$imdb_score ~ imdb$content, xlab = "Rating", ylab = "IMDB Score", main = "IMDB Scores by Rating")

content_rating_table = table(imdb$content)
barplot(content_rating_table, main = "Rating Frequencies", xlab = "Rating", ylab = "Frequency", col=rainbow(4))

# Genre x Score
genre_colors = c("#FFA07A", "#00CED1", "#FFD700", "#9370DB", "#8FBC8F", "#FF69B4")
boxplot(imdb$imdb_score ~ imdb$genre, main="IMDB Score by Genre", 
        xlab="Genre", ylab="IMDB Score", col=genre_colors)

genre_table = table(imdb$genre)
barplot(genre_table, main = "Genre Frequencies", xlab = "Genre", ylab = "Frequency", col=genre_colors)