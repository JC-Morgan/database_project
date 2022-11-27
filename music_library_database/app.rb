require_relative 'lib/artist_repository'
require_relative 'lib/album_repository'
require_relative 'lib/database_connection'

class Application

  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @artist_repository = ArtistRepository.new
    @album_repository = AlbumRepository.new
    @io = io
  end

  def list_artists
    artists_list = []
    @artist_repository.all.each do |artist|
      artists_list << "#{artist.id} - #{artist.name} - #{artist.genre}"
    end

    artists_list.each do |artist|
      @io.puts artist
    end
  end

  def list_albums
    albums_list = []
    @album_repository.all.each do |album|
      albums_list << "#{album.id} - #{album.title} - #{album.release_year} - #{album.artist_id}"
    end

    albums_list.each do |album|
      @io.puts album
    end
  end

  def find_album
    @io.puts "Enter id of album:"
    selection = @io.gets.chomp
    album = @album_repository.find(selection)
    @io.puts "#{album.id} - #{album.title} - #{album.release_year} - #{album.artist_id}"
  end

  def run

    @io.puts "Welcome to the music library manager!"

    @io.puts "What would you like to do?"
    @io.puts "1 - List all albums"
    @io.puts "2 - List all artists"
    @io.puts "3 - Find an album (with id)"

    @io.puts "Enter Your Choice:"
    selection = @io.gets.chomp

    if selection == "1"
      list_albums
    elsif selection == "2"
      list_artists
    elsif selection == "3"
      find_album
    else
      puts "Not a valid option."
    end

  end

end


 if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end

