require ("pry")
require_relative("./Artist.rb")
require_relative("./Album.rb")


# Artist.delete_all()
# Album.delete_all()

artist1 = Artist.new({'name' => "Elvis"})
artist1.save()

album1 = Album.new({
  'title' => '68 Comeback Tour',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })
album1.save()

album2 = Album.new({
  'title' => 'Viva Las Vegas',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })
album2.save()



binding.pry
nil
