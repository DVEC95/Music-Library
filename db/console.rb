require("pry")
require_relative("../models/artist")
require_relative("../models/album")

artist1 = Artist.new({
  'name' => 'Kraftwerk'
  })

artist1.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Computer World',
  'genre' => 'Electronic',
  })

album1.save()

binding.pry
nil
