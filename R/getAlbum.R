#' GetAlbum
#'
#' This function searches for data from an album based on album_id and api key
#'
#' @param id_album ID of an artist's album
#' @param apikey You API Key provided by MusixMatch
#' @export
#' @examples
#' apikey="YOUR_API_KEY"
#' getAlbum(4250417,apikey)


getAlbum<-function(id_album,apikey){
  require(jsonlite)
  data<-fromJSON(paste0(
    "http://api.musixmatch.com/ws/1.1/album.get?album_id=",id_album,"&apikey=",apikey))

  metadata<-data.frame(artist_id=data$message$body$album$artist_id,
                       artist_name=data$message$body$album$artist_name,
                       album_id=data$message$body$album$album_id,
                       album_name=data$message$body$album$album_name,
                       album_rating=data$message$body$album$album_rating,
                       album_track_count=data$message$body$album$album_track_count,
                       album_release_date=data$message$body$album$album_release_date,
                       album_release_type=data$message$body$album$album_release_type,
                       album_label=data$message$body$album$album_label,
                       album_cover=data$message$body$album$album_coverart_100x100)

  return(metadata)
}
