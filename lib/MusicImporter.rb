class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
  end

  def import
    files.each {|song| Song.create_from_filename(song)}
  end

end
