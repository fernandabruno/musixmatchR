# musixmatchR
Wrapper written in R for getting metadata about songs, bands, artists and lyrics from Musixmatch.

## Getting Started

This package allows you to get data from MusixMatch database. I started using the API to access band's lyrics and I thought it would be a great opportunity to share it with other people that have the same needs =)


### Prerequisites

First things first: To use the package without difficulty, it is important that you create an application to provide you an API Key from MusixMatch. 
An easy way to do so is accessing [MusixMatch Developers Page](https://developer.musixmatch.com/admin/applications) . After you create an application, a Key will be provided to you. 
This key is very important for you to be able to access all features on the package.

### Installing
To get **musixmatchR** running, you have to use **devtools** since it is not available on CRAN yet.

```r
library(devtools)
install_github("fernandabruno/muixmatchR")
```
To make the package simpler to use, it is important that you create a object called *apikey* to store your API Key and to use it as a parameter as you call the functions.
For example:

```r
apikey<-"YOUR_API_KEY"
```

## Accessing data
With your created api key, you are ready to access all the funcionalities provided by musixmatchR package. 
Let's give it a try.

### Getting data about Artists or Bands

Searches Musixmatch database for a provided band, singer or artist.

```r
artists <- getArtists("Taylor Swift",apikey)
|    artist_id  |                          artist_name    |artist_country |artist_rating  |twiter_url
|1     259675   |                       Taylor Swift      |         US    |        95     |https://twitter.com/taylorswift13
|2   24451377   |                テイラー・スウィフト       |               |        17     |
|3   34690605   | Taylor Swift feat. Ed Sheeran & Future  |               |        61     |
|4   32915417   |               ZAYN feat. Taylor Swift   |               |        61     |
|5   13920947   |              B.o.B feat. Taylor Swift   |               |        39     |
|6   28705075   |     Taylor Swift feat. Kendrick Lamar   |               |        45     |
|7   14015404   |         Taylor Swift feat. Ed Sheeran   |               |        45     |
|8   13903196   |     Taylor Swift feat. The Civil Wars   |               |        45     |
|9   13864003   |    Boys Like Girls feat. Taylor Swift   |               |        40     |
|10  13814620   |     Taylor Swift feat. Colbie Caillat   |               |        31     |                        
```
