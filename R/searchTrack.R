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
  
  
  metadata<-data.frame(track_id=data$message$body$track_list$track$track_id,
                       nomes=data$message$body$track_list$track$track_name,
                       track_rating=data$message$body$track_list$track$track_rating,
                       track_length=data$message$body$track_list$track$track_length,
                       track_has_lyrics=data$message$body$track_list$track$has_lyrics,
                       track_richsync=data$message$body$track_list$track$has_richsync,
                       track_numfavs=data$message$body$track_list$track$num_favourite,
                       album_name=data$message$body$track_list$track$album_name,
                       track_album_name=data$message$body$track_list$track$album_id,
                       track_release=data$message$body$track_list$track$first_release_date,
                       genre_list=data$message$body$track_list$track$primary_genres$music_genre_list[[1]]$music_genre$music_genre_name[1],
                       stringsAsFactors = FALSE)
  return(metadata)
  
}
