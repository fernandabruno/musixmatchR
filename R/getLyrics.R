#' getLyrics
#'
#' This function gets the lyrics of a track.
#'
#' @param idtrack Track's ID
#' @param apikey Your API Key provided by MusixMatch
#' @export
#' @examples
#' apikey="YOUR_API_KEY")
#' getlyrics(15953433,apikey)

getLyrics<-function(id_track,apikey){
  require(jsonlite)
  metadata<-fromJSON(paste0(
    "http://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=",id_track,"&apikey=",apikey))

  tracks<-data.frame(track_id=id_track,
                    lyrics_id=metadata$message$body$lyrics$lyrics_id,
                    explicit=metadata$message$body$lyrics$explicit,
                    instrumental=metadata$message$body$lyrics$instrumental,
                    lyrics_body=gsub("[\r\n]", " ", metadata$message$body$lyrics$lyrics_body),
                    lyrics_language=metadata$message$body$lyrics$lyrics_language_description)

  return(tracks)
}
