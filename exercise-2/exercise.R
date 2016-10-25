### Exercise 2 ###

# As you noticed, it often takes multiple queries to retrieve the desired information.
# This is a perfect situation in which writing a function will allow you to better structure your
# code, and give a name to a repeated task.
library(jsonlite)
setwd('~/Documents/info-201/m10-apis/exercise-2/')


# Write a function that allows you to specify an artist, and returns the top 10 tracks of that artist
TopTenTracks <- function(my_artist) {
  base <- 'https://api.spotify.com/v1/'
  
  search <- paste0('search?q=', my_artist, '&type=artist')
  
  artist.url <- paste0(base,search)
   
  artist.data <- fromJSON(artist.url)
  
  artist.id <- artist.data$artists$items$id[1]
  
  album.query <- paste0(base, 'artists/', artist.id, '/top-tracks?country=US')
  
  top.tracks <- fromJSON(album.query)
  
  return(top.tracks$tracks)
}


# What are the top 10 tracks by Nelly?
TopTenTracks('Nelly')



### Bonus ### 
# Write a function that allows you to specify a search type (artist, album, etc.), and a string, 
# that returns the album/artist/etc. page of interest
SearchTypeFor <- function(type, string) {

  base <- 'https://api.spotify.com/v1/'
  
  search <- paste0(base, 'search?', 'q=', string, '&type=', type)
  
  artist.info <- fromJSON(search)
  
  return(artist.info)
}

# Search albums with the word "Sermon"
SearchTypeFor('album', 'Sermon')
