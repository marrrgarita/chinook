### Active Record Query Interface Assignment

### Provide one or more Active Record queries that retrieve the requested data
### below each of the following questions:


# 1a) Find the genre with the name "Hip Hop/Rap".

Genre.find_by(name: 'Hip Hop/Rap')
  Genre Load (1.2ms)
=> #<Genre id: 17, name: "Hip Hop/Rap", created_at: "2013-01-20 02:04:31", updated_at: "2014-01-29 22:14:08">

# 1b) Count how many tracks belong to the "Hip Hop/Rap" genre

Track.where(genre_id: 17).count


# 2) Find the total amount of time required to listen to all the tracks in the database.

Track.sum("milliseconds")
   (6.9ms)  SELECT SUM("tracks"."milliseconds") FROM "tracks"
=> 1378575827

# 3a) Find the highest price of any track that has the media type "MPEG audio file".

Track.where(media_type_id: MediaType.find_by(name: 'MPEG audio file')).order(unit_price: :desc).limit(1).first

=> #<Track id: 6, album_id: 1, genre_id: 1, media_type_id: 1, name: "Put The Finger On You", composer: "Angus Young, Malcolm Young, Brian Johnson", milliseconds: 205662, bytes: 6713451, unit_price: #<BigDecimal:7fe4e58e3128,'0.99E0',9(18)>, created_at: "2005-01-03 05:49:26", updated_at: "2014-01-29 22:14:56">


# 3b) Find the name of the most expensive track that has the media type "MPEG audio file".

See above


# 4) Find the 2 oldest artists.
Artist.order(created_at: :asc).limit(2)


### Stretch Exercise (Active Record Query Interface)


# 1) Find all the albums whose titles start with B.

Album.where('title ilike ?', 'B%')
