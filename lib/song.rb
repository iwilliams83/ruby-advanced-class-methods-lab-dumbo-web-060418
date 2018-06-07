class Song
  attr_accessor :name, :artist_name
  @@all = []

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

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if song == nil
      self.create_by_name(song_name)
    else
      song
    end
  end

  def self.new_from_filename(file_name)
    file_name = file_name.split(' - ')
    song = self.new
    song.name = (file_name[1].split('.'))[0]
    song.artist_name = file_name[0]
    song
  end

  def self.create_from_filename(file_name)
    file_name = file_name.split(' - ')
    song = self.new
    song.name = (file_name[1].split('.'))[0]
    song.artist_name = file_name[0]
    song.save
    song
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def save
    self.class.all << self
  end



end
