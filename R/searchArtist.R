#' searchArtist
#'
#' This function gets the artist data from MusixMatch database.
#'
#' @param artist Artist's name
#' @param apikey Your API Key provided by MusixMatch
#' @export
#' @examples
#' apikey="YOUR_API_KEY"
#' searchArtist("Taylor Swift",apikey)


searchArtist<-function(artist,apikey){
  require(jsonlite)
  artist<-gsub(" ", "%20", artist)
  data<-fromJSON(paste0(
    "http://api.musixmatch.com/ws/1.1/artist.search?q_artist=",artist,"&apikey=",apikey))

  metadata<-data.frame(artist_id=data$message$body$artist_list$artist$artist_id,
                       artist_name=data$message$body$artist_list$artist$artist_name,
                       artist_country=data$message$body$artist_list$artist$artist_country,
                       artist_rating=data$message$body$artist_list$artist$artist_rating,
                       twiter_url=data$message$body$artist_list$artist$artist_twitter_url)


  return(metadata)
}
