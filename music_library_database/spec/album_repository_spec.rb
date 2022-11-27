require 'album_repository'
require 'album'
require 'spec_helper'

describe AlbumRepository do

  def reset_albums_table
    seed_sql = File.read('spec/seeds_artists_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_albums_table
  end

  it "returns all albums" do

    repo = AlbumRepository.new
    albums = repo.all

    expect(albums.length).to eq 3
    expect(albums.first.title).to eq "Surfer Rosa"
    expect(albums.first.release_year).to eq "1988"
    expect(albums.first.artist_id).to eq "1"

    expect(albums[1].title).to eq "Doolittle"
    expect(albums[1].release_year).to eq "1989"
    expect(albums[1].artist_id).to eq "1"

    expect(albums.last.title).to eq "Smoke + Mirrors"
    expect(albums.last.release_year).to eq "2014"
    expect(albums.last.artist_id).to eq "2"

  end

  it "returns empty when there are no albums in the database" do

    repo = AlbumRepository.new
    albums = repo.all

    3.times do
      albums.delete(albums[0])
    end

    expect(albums).to eq []
  end

  it " Returns a single Album object that corresponds with the id requested" do

    repo = AlbumRepository.new
    album = repo.find(3)

    expect(album.title).to eq "Smoke + Mirrors"
    expect(album.release_year).to eq "2014"
    expect(album.artist_id).to eq "2"
  end

  it "Adds an album to the database when the create method is used" do

    repo = AlbumRepository.new
    album = Album.new

    album.title = 'Trompe le Monde'
    album.release_year = 1991
    album.artist_id = 1

    repo.create(album)
    albums = repo.all

    expect(albums.last.title).to eq "Trompe le Monde"
    expect(albums.last.release_year).to eq "1991"
    expect(albums.last.artist_id).to eq "1"

  end

end
