class Api::V1::AuthorsController < ApplicationController

  def show
    author = Author.find(params[:id])
    render json: author, include: { books: { only: [:id, :book_title] } }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Author not found' }, status: :not_found
  end
  
  def index
    authors = Author.all
    render json: authors, include: { books: { only: [:id, :book_title] } }, status: :ok
  end
  

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :date_of_birth, books_attributes: [:book_title])
  end
end
