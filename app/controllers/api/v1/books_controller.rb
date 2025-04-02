class Api::V1::BooksController < ApplicationController
  def show
    book = Book.find(params[:id])
    render json: book_with_authors(book), status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Book not found' }, status: :not_found
  end

  def index
    books = Book.all
    render json: books.map { |book| book_with_authors(book) }, status: :ok
  end

  private

  def book_params
    params.require(:book).permit(:book_title, author_ids: [])
  end

  # Helper method to format book with its authors' details
  def book_with_authors(book)
    {
      id: book.id,
      book_title: book.book_title,
      authors: book.authors.map { |author| { id: author.id, name: "#{author.first_name} #{author.last_name}" } }
    }
  end
end
