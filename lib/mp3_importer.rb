require "pry"
class MP3Importer

  attr_accessor :path
  attr_writer :files

  def initialize(filepath)
    @path = filepath
  end

  def files
    Dir["#{path}/*"].collect {|song| song.gsub("#{path}/","")}

  end

  def import
    # #get into the path
    # new_directory = Dir.chdir path
    # #go through each file, may need to parse by /n
    # #then call Song.new_by_filename(filename)
    files.each do |song|
      Song.new_by_filename(song)
    end
    # binding.pry

  end



end
