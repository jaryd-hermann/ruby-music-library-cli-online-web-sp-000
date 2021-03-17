class Artist
attr_accessor :name, :genre
extend Concerns::Findable
@@all = []

def initialize(name)
  @name = name
  @songs = []
  save
end

def self.create(artist)
  artist = self.new(artist)
  artist.save
  artist
end

def save
  @@all << self
end


def songs
  Song.all.select {|song| song.artist == self}
end

def self.all
   @@all
 end

def self.destroy_all
  @@all.clear
end

def add_song(song)
  song.artist = self unless song.artist
  songs << song unless songs.include?(song)
end

def genres
  songs.collect { |song| song.genre}.uniq
end


end #end class
