#' searchtrack
#'
#' This function searches for track in MusixMatch database.
#'
#' @param artist Artist's name
#' @param song Song's name
#' @param apikey Your API Key provided by MusixMatch
#' @export
#' @examples
#' apikey="YOUR_API_KEY"
#' searchTrack("Taylor Swift","Blank Space",apikey)

searchTrack<-function(artist,song,apikey){
  require(jsonlite)
  artist<-gsub(" ", "%20", artist)
  song<-gsub(" ", "%20", song)
  data<-jsonlite::fromJSON(paste0(
    "http://api.musixmatch.com/ws/1.1/track.search?q_artist=",artist,"&q_track=",song,"&apikey=",apikey))
  
  
  metadata<-data.frame(track_id=unlist(data$message$body$track_list$track$track_id),
                       track_name=data$message$body$track_list$track$track_name,
                       album_name=data$message$body$track_list$track$album_name,
                       album_id=data$message$body$track_list$track$album_id,
                       artist_name=data$message$body$track_list$track$artist_name,
                       artist_id=data$message$body$track_list$track$artist_id,
                       track_rating=data$message$body$track_list$track$track_rating,
                       track_has_lyrics=data$message$body$track_list$track$has_lyrics,
                       track_numfavourite=data$message$body$track_list$track$num_favourite,
                       explicit=data$message$body$track_list$track$explicit,
                       stringsAsFactors = FALSE)
  return(metadata)
  }
