class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
     input = ''

     while input != 'exit'
       puts "Welcome to your music library!"
       puts "To list all of your songs, enter 'list songs'."
       puts "To list all of the artists in your library, enter 'list artists'."
       puts "To list all of the genres in your library, enter 'list genres'."
       puts "To list all of the songs by a particular artist, enter 'list artist'."
       puts "To list all of the songs of a particular genre, enter 'list genre'."
       puts "To play a song, enter 'play song'."
       puts "To quit, type 'exit'."
       puts "What would you like to do?"
       input = gets.chomp

       case input
       when 'list songs'
         self.list_songs
       when 'list artists'
         self.list_artists
       when 'list genres'
         self.list_genres
       when 'list artists'
         self.list_artists
       when 'list artist'
         self.list_songs_by_artist
       when 'list genre'
         self.list_songs_by_genre
       when 'play song'
         self.play_song
       else
         "Type in a valid request please"
       end
     end
   end


   #CLI Methods
   def self.list_songs
     Song.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

    def self.list_artists
    end

    def self.list_genres
    end

    def self.list_songs_by_artist
    end

    def self.list_songs_by_genre
    end

    def self.play_song
    end
end

end #end