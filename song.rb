class Song
  attr_accessor :title, :artist, :album_name, :genre

  def initialize(title, artist, album_name, genre)
    @title = title
    @artist = artist
    @album_name = album_name
    @genre = genre
  end
end