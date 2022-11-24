# Book Store Model and Repository Classes Design Recipe

## 1. Design and create the Table


```mermaid
sequenceDiagram
    participant t as terminal
    participant app as Main program (app.rb)
    participant ar as BookRepository class <br /> (in lib/book_repository.rb)
    participant db_conn as DatabaseConnection class <br /> (in lib/database_connection.rb)
    participant db as Postgres database

    Note left of t: Flow of time <br />⬇ <br /> ⬇ <br /> ⬇

    t->>app: Runs `ruby app.rb`
    app->>db_conn: Opens connection to database calling method `connect` on DatabaseConnection
    db_conn->>db_conn: Opens database connection using PG and stores the connection
    app->>ar: Calls method `all` on BookRepository
    ar->>db_conn: Sends SQL query by calling method `exec_params` on DatabaseConnection
    db_conn->>db: Sends query to database via the open database connection
    db->>db_conn: Returns an array of hashes, one for each row of the books table

    db_conn->>ar: Returns an array of hashes, one for each row of the books table
    loop
        ar->>ar: Loops through array and creates a Book object for every row
    end
    ar->>app: Returns array of Book objects
    app->>t: Prints list of books to terminal
```

## 2. Create Test SQL seeds

## 3. Define the class names

```ruby
# EXAMPLE
# Table name: books

# Model class
# (in lib/book.rb)
class Book
end

# Repository class
# (in lib/book_repository.rb)
class BookRepository
end
```

## 4. Implement the Model class


```ruby
# EXAMPLE
# Table name: books

# Model class
# (in lib/book.rb)

class Book
  attr_accessor :id, :title, :author_name
end

```


## 5. Define the Repository Class interface

```ruby
# EXAMPLE
# Table name: books

# Repository class
# (in lib/book_repository.rb)

class BookRepository

  # Selecting all records
  # No arguments
  def all

    # Executes the SQL query:
    # SELECT id, title, author_name FROM books;

    # Returns an array of Book objects.
  end

  def all_list
    # Returns a list of Book objects
    # In the form:

    # 1 - Nineteen Eighty-Four - George Orwell
    # 2 - Mrs Dalloway - Virginia Woolf
    # 3 - Emma - Jane Austen
    # 4 - Dracula - Bram Stoker
    # 5 - The Age of Innocence - Edith Wharton)
  end

end

```

## 6. Write Test Examples

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all books

repo = BookRepository.new

books = repo.all

books.length # =>  2

books[0].id # =>  1
books[0].title # =>  'Nineteen Eighty-Four'
books[0].author_name # =>  'George Orwell'

books[1].id # =>  2
books[1].title # =>  'Mrs Dalloway'
books[1].author_name # => 'Virginia Woolf'

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run


## 8. Test-drive and implement the Repository class behaviour

