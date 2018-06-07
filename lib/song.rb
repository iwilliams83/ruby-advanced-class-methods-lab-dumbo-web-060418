class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  # end

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

  def self.create_from_filename(file_name)
    file_name = file_name.split(' - ')
    song = self.new
    song.name = (file_name[1].split('.'))[0]
    song.artist_name = file_name[0]
    song
  end

  def save
    self.class.all << self
  end

end
