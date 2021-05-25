require_relative "song"
require_relative "playlist"
require "tty-prompt"

class PlaylistApp
  def initialize
    system("clear")
  end

  def start
    print_welcome_screen
    initiation_menu
  end

  def print_welcome_screen
    puts
    puts "**********************************"
    puts "* Welcome to the Playlist Maker! *"
    puts "**********************************"
    puts
  end

  def initiation_menu
    prompt = TTY::Prompt.new
    choices = ["Load Playlist", "Create Playlist"]
    answer = prompt.select("Would you like to load a playlist or start a new playlist?", choices)

    if answer == "Load Playlist"
      load_playlist
    elsif answer == "Create Playlist"
      create_playlist
    else
    end
  end

  def load_playlist
    puts "What is the name of the file you would like to load?"
    file = gets.chomp
    if (File.exists?("#{file}"))
      puts
      @playlist = Playlist.new(file)

      main_menu
      # puts "Here is your playlist:"
      # puts
      # pp @playlist.songs
    else
      puts
      puts "That file does not exist"
      initiation_menu
    end
  end

  def create_playlist
    @playlist = Playlist.new

    add_song
  end

  def main_menu
    puts
    prompt = TTY::Prompt.new
    choices = ["Add song", "Delete song", "View Playlist", "Save playlist", "Exit without saving"]
    answer = prompt.select("Would you like to:?", choices)

    if answer == "Add song"
      add_song
    elsif answer == "Delete song"
      delete_song
    elsif answer == "View Playlist"
      view_playlist
    elsif answer == "Save playlist"
      save_playlist
    elsif answer == "Exit without saving"
      exit_wo_saving
    end
  end

  def add_song
    puts "Let's add a song to your playlist..."

    print "The title is: "
    title = gets.chomp
    print "The artist is: "
    artist = gets.chomp
    print "The album name is: "
    album_name = gets.chomp
    print "And the genre is: "
    genre = gets.chomp

    @playlist.add_song(title, artist, album_name, genre)
    puts
    puts "#{title} was added to playlist: #{@playlist}"
    main_menu
  end

  def delete_song
    puts
    puts "What is the title of the song you would like to delete?"
    song_title = gets.chomp
    @playlist.delete_song(song_title)
    puts "Here is your playlst:"
    view_playlist
    main_menu
  end

  def view_playlist
    puts
    pp @playlist.songs
    main_menu
  end

  def save_playlist
    puts
    puts "What would you like to call your playlist?"
    filename = gets.chomp
    csv_file = "#{filename}.csv"
    @playlist.save_to_file(csv_file)
    puts "playlist saved as #{csv_file}."
    puts "goodbye!"
  end

  def exit_wo_saving
    puts
    puts "Goodbye"
  end
end

PlaylistApp.new.start

# puts "Welcome to the Playlist Maker!"
# puts
# puts "Would you like to load a previously saved playlist [Y/N]"
# answer = gets.chomp
# if answer.upcase == "Y"
#   puts "What is the name of the file you would like to load?"
#   file = gets.chomp
#   @playlist = Playlist.new(file)
#   puts "Here is your playlist:"
#   puts
#   pp @playlist.songs

#   puts "Would you like to add a song, group by"
# elsif answer.upcase == "N"
#   puts "Starting fresh I see! Great, let's make a new playlist. What would you like to call the playlist?"
#   @playlist_name = gets.chomp
#   puts "Great you playlist is now saved as #{@playlist_name}"

#   puts "Let's add some songs to your playlist."
#   print "The title is: "
#   title = gets.chomp
#   print "The artist is: "
#   artist = gets.chomp
#   print "The album name is: "
#   album_name = gets.chomp
#   print "And the genre is: "
#   genre = gets.chomp

#   @playlist = Playlist.new
#   @playlist.add_song(title, artist, album_name, genre)

#   pp @playlist.songs
# end

# # while true
# # end
