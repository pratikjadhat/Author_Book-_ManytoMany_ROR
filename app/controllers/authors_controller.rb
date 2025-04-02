class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
    @author.books.build # Build a book object when creating an author
  end

  def create
    @author = Author.new(author_params)

    # Check if existing authors are selected and associate them with the new book
    if params[:author][:existing_author_ids].present?
      existing_authors = Author.where(id: params[:author][:existing_author_ids])
      existing_authors.each do |existing_author|
        # Associate the book with the existing authors
        @author.books.each do |book|
          existing_author.books << book unless existing_author.books.include?(book)
        end
      end
    end

    if @author.save
      flash[:notice] = "Author and book(s) created successfully!"
      redirect_to authors_path
    else
      flash.now[:alert] = "Failed to create author. Please try again."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # This is for editing the author details
  end

  def update
    if @author.update(author_params)
      flash[:notice] = "Author updated successfully!"
      redirect_to author_path(@author)
    else
      flash.now[:alert] = "Failed to update author. Please try again."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # Destroy the author
    @author.destroy

    respond_to do |format|
      format.html do
        flash[:notice] = "Author was successfully deleted."
        redirect_to authors_url
      end
      format.js   # This will look for a destroy.js.erb file for AJAX handling
    end
  end

  private

  def author_params
    params.require(:author).permit(
      :first_name, :last_name, :date_of_birth, :reference_author_id,
      books_attributes: [:id, :book_title, :_destroy],
      existing_author_ids: [] # Allows the existing author IDs to be passed
    )
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
