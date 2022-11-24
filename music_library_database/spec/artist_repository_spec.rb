require 'artist_repository'

describe ArtistRepository do

  def reset_artists_table
    seed_sql = File.read('spec/seeds_artists_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_artists_table
  end


  it "returns all artists" do

    repo = ArtistRepository.new
    artists = repo.all

    expect(artists.length).to eq 2
    expect(artists.first.name).to eq "Pixies"
    expect(artists.first.genre).to eq "Rock"


    expect(artists.last.name).to eq "Imagine Dragons"
    expect(artists.last.genre).to eq "Pop Rock"


  end

  it "returns empty when there are no artists in the database" do

    repo = ArtistRepository.new
    artists = repo.all

    2.times do
      artists.delete(artists[0])
    end

    expect(artists).to eq []
  end

end
