class Api::V1::AuthorsController < ApplicationController
  # Create an author
  def create
    author = Author.new(author_params)
    
    if author.save
      render json: author, status: :created
    else
      render json: { errors: author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Show a specific author with their books
  def show
    author = Author.find(params[:id])
    render json: author, include: { books: { only: [:book_title] } }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Author not found' }, status: :not_found
  end

  # List all authors
  def index
    authors = Author.all
    render json: authors, status: :ok
  end

  # Update an existing author
  def update
    author = Author.find(params[:id])
    
    if author.update(author_params)
      render json: author, status: :ok
    else
      render json: { errors: author.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Author not found' }, status: :not_found
  end

  # Delete an author
  def destroy
    author = Author.find(params[:id])
    author.destroy
    head :no_content # Respond with no content status after successful deletion
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Author not found' }, status: :not_found
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :date_of_birth, books_attributes: [:book_title])
  end
end
