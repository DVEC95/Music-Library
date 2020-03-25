require_relative('../db/sql_runner')
require_relative('./artist')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(album)
    @title = album['title']
    @genre = album['genre']
    @id = album['id'].to_i if album['id']
    @artist_id = album['artist_id'].to_i
  end

  def save()
    sql = 'INSERT INTO albums
    (
      artist_id,
      title,
      genre
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id'
    values = [@artist_id, @title, @genre]
    @id = SQLRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all
    sql = 'SELECT * FROM albums'
    albums = SQLRunner.run(sql, [])
    return albums.map {|album| Album.new(album)}
  end

  def self.find_albums(artist)
    sql = 'SELECT * FROM artists WHERE name = $1'
    values = [artist]
    artists = SQLRunner.run(sql, values)

    artist_id = artists[0]['id'].to_i
    sql = 'SELECT * FROM albums WHERE artist_id = $1'
    values = [artist_id]
    albums = SQLRunner.run(sql, values)
    return albums.map {|album| Album.new(album)}
  end

  def self.find_artist(album_title)
    sql = 'SELECT artist_id FROM albums WHERE title = $1'
    values = [album_title]
    results = SQLRunner.run(sql, values)
    artist_id = results[0]['artist_id'].to_i

    sql = 'SELECT * FROM artists WHERE id = $1'
    values = [artist_id]
    results = SQLRunner.run(sql, values)
    artist = results[0]['name']
    return artist
  end

end
