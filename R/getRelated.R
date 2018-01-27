#' GetRelated
#'
#' This function gets a list of artists somehow related to a given one.
#'
#' @param artist_id ID of the desired artist.
#' @param apikey Your API Key provided by MusixMatch.
#' @export
#' @examples
#' apikey="YOUR_API_KEY"
#' getRelated(56,apikey)


getRelated<-function(artist_id,apikey){
  require(jsonlite)
  artist<-gsub(" ", "%20", artist_id)
  data<-fromJSON(paste0(
    "http://api.musixmatch.com/ws/1.1/artist.related.get?artist_id=",artist,"&apikey=",apikey))

  metadata<-data.frame(artist_id=data$message$body$artist_list$artist$artist_id,
                       artist_name=data$message$body$artist_list$artist$artist_name,
                       artist_country=data$message$body$artist_list$artist$artist_country,
                       artist_rating=data$message$body$artist_list$artist$artist_rating,
                       twiter_url=data$message$body$artist_list$artist$artist_twitter_url)

  return(metadata)
}
