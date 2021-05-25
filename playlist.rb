require_relative "song"
require "csv"

class Playlist
  attr_reader :songs

  def initialize(filename = nil)
    @songs = []

    if filename
      file = CSV.read(filename)
      file.each do |song|
        add_song(song[3], song[1], song[0], song[2])
      end
    end
  end

  def add_song(title, artist, album_name, genre)
    # Your job is to fill this in.
    song = Song.new(title, artist, album_name, genre)
    @songs << song
  end

  def save_to_file(filename)
    # # Your job is to fill this in.
    # CSV.open(filename, "w") do |csv|
    #   csv << ["album", "artist", "genre", "title"]
    #   @songs.each do |song|
    #     csv << [song.album_name, song.artist, song.genre, song.title]
    #   end
    # end

    CSV.open(filename, "w") do |csv|
      @songs.each do |song|
        csv << [song.album_name, song.artist, song.genre, song.title]
      end
    end
  end

  def delete_song(song_title)
    # Your job is to fill this in.
    @songs.delete_if { |song| song.title == song_title }
  end

  def group_by_genre
    # Your job is to fill this in.
    sorted = @songs.sort_by { |song| song.genre }
    sorted
  end
end
