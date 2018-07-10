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


artist<-gsub(" ", "%20", artist)
  song<-gsub(" ", "%20", song)
  data<-fromJSON(paste0(
    "http://api.musixmatch.com/ws/1.1/track.search?q_artist=",artist,"&q_track=",song,"&apikey=",apikey))
  
  metadata<-data.frame(track_id=data$message$body$track_list$track$track_id,
                    id=data$message$body$track_list$track$track_spotify_id,
                    track_name=data$message$body$track_list$track$track_name,
                    track_rating=data$message$body$track_list$track$track_rating,
                    track_length=data$message$body$track_list$track$track_length,
                    track_has_lyrics=data$message$body$track_list$track$has_lyrics,
                    track_richsync=data$message$body$track_list$track$has_richsync,
                    track_numfavs=data$message$body$track_list$track$num_favourite,
                    album_name=data$message$body$track_list$track$album_name,
                    track_album_name=data$message$body$track_list$track$album_id,
                    track_release=data$message$body$track_list$track$first_release_date
                    )
  
  i=1
  j=1
  genpos=data.frame()
  genok<-data.frame()
  for(i in 1:length(data$message$body$track_list$track$primary_genres$music_genre_list)) {
    for(j in 1:length(data$message$body$track_list$track$primary_genres$music_genre_list[[i]]$music_genre$music_genre_name)){
      genpre<-(data$message$body$track_list$track$primary_genres$music_genre_list[[i]]$music_genre$music_genre_name[j])
      genok<-genpre
      genpos<-paste(genpos,genok,sep=",")
      #genpos<-rbind(genpos,genok)
    }
  }
  mid <- strsplit(genpos,",")
  mid1<-unique(sapply(mid,function(x) rle(x)$value))
  mid2<-mid1[mid1 != ""]
  
  i=0
  pre=data.frame()
  ok=data.frame()
  pos=data.frame()
  for(i in 1:length(mid2)){
    pre<-mid2[i]
    ok<-pre
    pos<-paste(pos,ok,sep=",")
  }
  
  metadata<-data.frame(metadata,substring(pos, 2))
  
  colnames(metadata)[12]<-"song_genre"
  
  return(metadata)
}
