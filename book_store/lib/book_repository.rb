require_relative './book'

class BookRepository

  def all
    @books = []

    sql = 'SELECT id, title, author_name FROM books;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      book = Book.new

      book.id = record['id']
      book.title = record['title']
      book.author_name = record['author_name']

      @books << book
    end

    return @books

  end

  def all_list
    books_list = []

    @books.each do |book|
      books_list << "#{book.id} - #{book.title} - #{book.author_name}"
    end

    return books_list.join("\n")
  end

end
