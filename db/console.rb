require("pry")
require_relative("../models/artist")
require_relative("../models/album")

# ARTIST DATA ---------------
artist1 = Artist.new({
  'name' => 'Radiohead'
  })

artist1.save()

artist2 = Artist.new({
  'name' => 'Daft Punk'
  })

artist2.save()

artist3 = Artist.new({
  'name' => 'Kraftwerk'
  })

artist3.save()


# ALBUM DATA -----------------
album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'OK Computer',
  'genre' => 'Alternative Rock'
  })
album1.save()

album2 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'In Rainbows',
  'genre' => 'Alternative Rock'
  })
album2.save()

album3 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'Homework',
  'genre' => 'Electronic'
  })

album3.save()

album4 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'Discovery',
  'genre' => 'Electronic'
  })

album4.save()

album5 = Album.new({
  'artist_id' => artist3.id,
  'title' => 'The Man-Machine',
  'genre' => 'Electronic'
  })

album5.save()

album6 = Album.new({
  'artist_id' => artist3.id,
  'title' => 'Computer World',
  'genre' => 'Electronic'
  })

album6.save()


binding.pry
nil
