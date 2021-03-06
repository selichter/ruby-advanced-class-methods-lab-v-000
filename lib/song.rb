class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
    self.class.all << self
  end

 def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end 
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    filename = filename.split(" - ")
    song.artist_name = filename[0]
    song.name = filename[1].gsub(".mp3", "")
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    filename = filename.split(" - ")
    song.artist_name = filename[0]
    song.name = filename[1].gsub(".mp3", "")
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

end




  