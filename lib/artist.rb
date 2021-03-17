class Artist
attr_accessor :name, :genre, :songs
extend Concerns::Findable
@@all = []

def initialize(name)
  @name = name
  @songs = []
  @all << self
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
    if song.artist == nil
      song.artist = self
    else
      nil
    end
    if @songs.include?(song)
      nil
    else
      @songs << song
    end
    song
  end

def genres
  songs.collect { |song| song.genre}.uniq
end


end #end class
