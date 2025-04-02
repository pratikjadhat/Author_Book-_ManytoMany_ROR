class Api::V1::BooksController < ApplicationController
<<<<<<< HEAD
  # Create a new book
  def create
    book = Book.new(book_params)
    
    if book.save
      render json: book_with_authors(book), status: :created
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Show a specific book with its authors
=======
>>>>>>> 3b110f1 (Modified Book create - added dropdown to existing user)
  def show
    book = Book.find(params[:id])
    render json: book_with_authors(book), status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Book not found' }, status: :not_found
  end

<<<<<<< HEAD
  # List all books
=======
>>>>>>> 3b110f1 (Modified Book create - added dropdown to existing user)
  def index
    books = Book.all
    render json: books.map { |book| book_with_authors(book) }, status: :ok
  end

<<<<<<< HEAD
  # Update an existing book
  def update
    book = Book.find(params[:id])
    
    if book.update(book_params)
      render json: book_with_authors(book), status: :ok
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Book not found' }, status: :not_found
  end

  # Delete a book
  def destroy
    book = Book.find(params[:id])
    book.destroy
    head :no_content # Respond with no content status after successful deletion
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Book not found' }, status: :not_found
  end

=======
>>>>>>> 3b110f1 (Modified Book create - added dropdown to existing user)
  private

  def book_params
    params.require(:book).permit(:book_title, author_ids: [])
  end

<<<<<<< HEAD
  # Helper method to format book with its authors' names
  def book_with_authors(book)
    authors = book.authors.map { |author| "#{author.first_name} #{author.last_name}" }
    book.as_json(include: { authors: { only: [] } }).merge(authors: authors)
=======
  # Helper method to format book with its authors' details
  def book_with_authors(book)
    {
      id: book.id,
      book_title: book.book_title,
      authors: book.authors.map { |author| { id: author.id, name: "#{author.first_name} #{author.last_name}" } }
    }
>>>>>>> 3b110f1 (Modified Book create - added dropdown to existing user)
  end
end
