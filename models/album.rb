require_relative('../db/sql_runner.rb')

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
    sql = "INSERT INTO albums
    (
      artist_id,
      title,
      genre
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@artist_id, @title, @genre]
    @id = SQLRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM albums"
    albums = SQLRunner.run(sql, [])
    return albums.map {|album| Album.new(album)}
  end

  def self.find(id)
    sql = 'SELECT * FROM albums WHERE artist_id = $1'
    values = [id]
    albums = SQLRunner.run(sql, values)
    return albums.map {|album| Album.new(album)}
  end

end
