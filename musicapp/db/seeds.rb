# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
b1 = Band.create!(name: "band_a")
b2 = Band.create!(name: "band_b")

a1 = Album.create!(band_id: b1.id, title: "title_1")
a2 = Album.create!(band_id: b2.id, title: "title_2")

t1 = Track.create!(album_id: a1.id, song: "song_1", lyrics: "hihihihihi")
t2 = Track.create!(album_id: a1.id, song: "song_2", lyrics: "byebyebye")
t3 = Track.create!(album_id: a2.id, song: "song1", lyrics: "huehuehue")
t4 = Track.create!(album_id: a2.id, song: "song2", lyrics: "jajajajaja")
