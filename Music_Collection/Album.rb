require('pg')
require_relative("../SQL_Runner")

class Album

attr_accessor :artist_id, :title, :genre
attr_reader :id

def initialize(options)
    @id = options['id'].to_i
    @artist_id = options['artist_id'].to_i
    @title = options['title']
    @genre = options['genre']
   end

def save()
       sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING *;"
       values = [@title, @genre, @artist_id]
       @id = SQLRunner.run(sql, values)[0]['id'].to_i
end

# def self.all()
#   db = PG.connect({ dbname: 'Music_Collection', host: 'localhost' })
#   sql = "SELECT * FROM albums"
#   db.prepare("all", sql)
#   orders = db.exec_prepared("all")
#   db.close()
#   return name.map { |name| Album.new(name) }
# end

def self.all()
  sql = "SELECT * FROM albums"
  albums = SQLRunner.run(sql)
  return album.map{|person| Album.new(person)}
end


  end
