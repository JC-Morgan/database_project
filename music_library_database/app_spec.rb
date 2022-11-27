require 'app'

describe Application do

  def reset_artists_table
    seed_sql = File.read('spec/seeds_artists_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  def reset_albums_table
    seed_sql = File.read('spec/seeds_artists_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_artists_table
    reset_albums_table
  end

  it "returns an accurate list of albums" do

    io = double :io
    expect(io).to receive(:puts).with("Welcome to the music library manager!")
    expect(io).to receive(:puts).with("What would you like to do?")
    expect(io).to receive(:puts).with("1 - List all albums")
    expect(io).to receive(:puts).with("2 - List all artists")
    expect(io).to receive(:puts).with("3 - Find an album (with id)")

    expect(io).to receive(:puts).with("Enter Your Choice:")

    expect(io).to receive(:gets).and_return("1")

    expect(io).to receive(:puts).with("1 - Doolittle - 1989 - 1")
    expect(io).to receive(:puts).with("2 - Surfer Rosa - 1988 - 1")
    expect(io).to receive(:puts).with("4 - Super Trouper - 1980 - 2")
    expect(io).to receive(:puts).with("5 - Bossanova - 1990 - 1")
    expect(io).to receive(:puts).with("6 - Lover - 2019 - 3")
    expect(io).to receive(:puts).with("7 - Folklore - 2020 - 3")
    expect(io).to receive(:puts).with("8 - I Put a Spell on You - 1965 - 4")
    expect(io).to receive(:puts).with("9 - Baltimore - 1978 - 4")
    expect(io).to receive(:puts).with("10 - Here Comes the Sun - 1971 - 4")
    expect(io).to receive(:puts).with("11 - Fodder on My Wings - 1982 - 4")
    expect(io).to receive(:puts).with("3 - Waterloo - 1972 - 2")
    expect(io).to receive(:puts).with("13 - Mezzanine - 1998 - 5")
    expect(io).to receive(:puts).with("14 - Smoke + Mirrors - 2014 - 6")

    app = Application.new('music_library', io, AlbumRepository.new, ArtistRepository.new)
    app.run

  end

  it "returns an accurate list of artists" do

    io = double :io
    expect(io).to receive(:puts).with("Welcome to the music library manager!")
    expect(io).to receive(:puts).with("What would you like to do?")
    expect(io).to receive(:puts).with("1 - List all albums")
    expect(io).to receive(:puts).with("2 - List all artists")
    expect(io).to receive(:puts).with("3 - Find an album (with id)")

    expect(io).to receive(:puts).with("Enter Your Choice:")

    expect(io).to receive(:gets).and_return("2")

    expect(io).to receive(:puts).with("1 - Pixies - Rock")
    expect(io).to receive(:puts).with("2 - ABBA - Pop")
    expect(io).to receive(:puts).with("3 - Taylor Swift - Pop")
    expect(io).to receive(:puts).with("4 - Nina Simone - Pop")
    expect(io).to receive(:puts).with("5 - Massive Attack - Alternative")
    expect(io).to receive(:puts).with("6 - Imagine Dragons - Pop Rock")

    app = Application.new('music_library', io, AlbumRepository.new, ArtistRepository.new)
    app.run

  end

  it "returns an album with a matching id to the one given" do

    io = double :io
    expect(io).to receive(:puts).with("Welcome to the music library manager!")
    expect(io).to receive(:puts).with("What would you like to do?")
    expect(io).to receive(:puts).with("1 - List all albums")
    expect(io).to receive(:puts).with("2 - List all artists")
    expect(io).to receive(:puts).with("3 - Find an album (with id)")

    expect(io).to receive(:puts).with("Enter Your Choice:")

    expect(io).to receive(:gets).and_return("3")

    expect(io).to receive(:puts).with("Enter id of album:")
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("3 - Waterloo - 1972 - 2")

    app = Application.new('music_library', io, AlbumRepository.new, ArtistRepository.new)
    app.run


  end

end
