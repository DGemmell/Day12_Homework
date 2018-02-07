require('pg')
require_relative("../SQL_Runner")

class Artist

  attr_reader :name, :id

 def initialize(options)
   @id = options['id'].to_i
   @name = options['name']
  end

  def save()
      sql = "INSERT INTO artists (name) VALUES ($1) RETURNING *;"
      values = [@name]
      @id = SQLRunner.run(sql, values)[0]['id'].to_i
  end

  # def self.all()
  #   db = PG.connect({ dbname: 'Music_Collection', host: 'localhost' })
  #   sql = "SELECT * FROM Artists"
  #   db.prepare("all", sql)
  #   orders = db.exec_prepared("all")
  #   db.close()
  #   return name.map { |name| Artist.new(name) }
  # end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SQLRunner.run(sql)
    return artists.map{|person| Artist.new(person)}
 end

end
