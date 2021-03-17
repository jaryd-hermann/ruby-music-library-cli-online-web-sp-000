class Genre
attr_accessor :name
extend Concerns::Findable


@@all = []

def initialize(name)
  @name = name
  @songs = []
  save
end

def self.create(genre)
  genre = self.new(genre)
  genre.save
  genre
end

def save
  @@all << self
end


def self.all
   @@all
 end

def self.destroy_all
  @@all.clear
end

def artists
  self.songs.collect {|song| song.artist}.uniq
end

def songs
  Song.all.select {|song| song.genre == self}
end

end #end class
