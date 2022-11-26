require_relative 'album.rb'

class AlbumRepository

  def all

    albums = []
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|

      album = Album.new

      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']

      albums << album

    end

    return albums

  end

  def find(id)

    sql = 'SELECT id, title, release_year, artist_id FROM albums WHERE id=$1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)

    result = result_set[0]
    album = Album.new

    album.id = result['id']
    album.title = result['title']
    album.release_year = result['release_year']
    album.artist_id = result['artist_id']

    return album

  end

  def create(album)

    sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3);'
    sql_params = [album.title, album.release_year, album.artist_id]

    DatabaseConnection.exec_params(sql, sql_params)

    return nil

  end

end
