### Exercise 5 ###
library(jsonlite)
library(dplyr)

# Write a function that allows you to specify a movie, then does the following:

  # Replace all of the spaces in your movie title with plus signs (+)
MovieReview <- function(my_movie) {
  parse.movie <- gsub(" ", "+", my_movie)
 
  # Construct a search query using YOUR api key
  # The base URL is https://api.nytimes.com/svc/movies/v2/reviews/search.json?
  # See the interactive console for more detail:https://developer.nytimes.com/movie_reviews_v2.json#/Console/GET/reviews/search.json
  base.url <- "https://api.nytimes.com/svc/movies/v2/reviews/search.json?"
  api.key <- "&api-key=8088e962f5bd487c8e6ad348aa3ece56"
  request <- paste0(base.url, "query=", parse.movie, api.key)
  
  # Request data using your search query
  movie.data <- fromJSON(request)
  
  # What type of variable does this return?

  # Flatten the data stored in the `$results` key of the data returned to you
  flattened <- flatten(movie.data$results)
  
  # From the most recent review, store the headline, short summary, and link to full article each in their own variables
  recent.review <- flattened[1,]
  headline <- recent.review$headline
  summary <- recent.review$summary_short
  link <- recent.review$link.url
  
  # Return an list of the three pieces of information from above
  movie.list <- list(headline = headline, summary = summary, link = link) 
  return(movie.list)
}
# Test that your function works with a movie of your choice
MovieReview("Star Trek")
