require "pry"

class Song

  attr_accessor :name, :artist



  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    # binding.pry
    artist,song,genre = file_name.split(" - ")
    new_song_instance = self.new(song)
    new_song_instance.artist_name = artist
    new_song_instance
  end


  def artist_name=(name)
    artist_find = Artist.find_or_create_by_name(name)
    artist_find.add_song(self)
    artist_find.save
    self.artist = artist_find
  end
end
