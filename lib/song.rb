class Song
  attr_accessor :name, :artist_name, :file_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all<< song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    #Build a class constructor Song.create_by_name that takes in the string name of a song and returns a song instance with that name set as its name property and the song being saved into the @@all class variable.
    song = Song.create
    song.name = name
    song    
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name==name}
  end

  def self.find_or_create_by_name(name)
    #calls the FBN method to check if an object exists for name, if not it makes one.
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end


  def self.new_from_filename(file_name)
#     Build a class constructor that accepts a filename in the format of "<Artist Name> - <Song Name>.mp3", for example, "Taylor Swift - Blank Space.mp3".

# Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), the constructor should return a new Song instance with song_name set to Blank Space and artist_name set to Taylor Swift. The filename input sent to Song.new_from_filename in the format of Taylor Swift - Blank Space.mp3 must be parsed for the relevant components. Separate the artist name from the rest of the data based on the - delimiter. Don't forget that when you parse the song name, you have to remove the '.mp3' part of the string.
    raw_name = file_name[0..-5].split("-")
    artist_name = raw_name[0].strip
    song_name = raw_name[1].strip
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    #variation of the above that uses the CBN method
    raw_name = file_name[0..-5].split("-")
    artist_name = raw_name[0].strip
    song_name = raw_name[1].strip
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
