class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.includes(:authors).all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "Book created successfully!"
    else
      flash.now[:alert] = "Failed to create book. Please try again."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: "Book updated successfully!"
    else
      flash.now[:alert] = "Failed to update book. Please try again."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # Remove associated authors, but keep the authors in the database
    @book.authors.clear  
    @book.destroy

    respond_to do |format|
      format.html do
        flash[:notice] = "Book was successfully deleted."
        redirect_to books_path
      end
      format.js  # Render the destroy.js.erb file if using AJAX for smooth deletion
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to books_path, alert: "Book not found!"
  end

  def book_params
    params.require(:book).permit(:book_title, author_ids: [])
  end
end
