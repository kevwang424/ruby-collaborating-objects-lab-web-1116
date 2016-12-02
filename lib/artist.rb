class Artist

  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song_instance)
    @songs << song_instance
  end

  def save
    @@all << self
  end

  def self.all
    # binding.pry
    @@all.uniq
  end

  def self.find_or_create_by_name(artist_name)
    existing_artist = self.all.find {|artist_instance| artist_instance.name == artist_name}
    unless existing_artist
      Artist.new(artist_name)
    else
      existing_artist
    end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
