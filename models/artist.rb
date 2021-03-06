require_relative('../db/sql_runner')
require_relative('./album')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(artist)
    @id = artist['id'].to_i if artist['id']
    @name = artist['name']
  end

  def save()
    sql = 'INSERT INTO artists
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING *'
    values = [@name]
    @id = SQLRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM artists'
    artists = SQLRunner.run(sql, [])
    return artists.map {|artist| Artist.new(artist)}
  end

  def update()
    sql = 'UPDATE artists SET
    name = $1 WHERE id = $2'
    values = [@name, @id]
    SQLRunner.run(sql, values)
  end

  def Artist.delete_all()
    sql = 'DELETE FROM artists'
    SQLRunner.run(sql, [])
  end

end
