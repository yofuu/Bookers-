class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def create
    books =Book.new(books_params)
    book.save
    redirect_to book_path(books.id)
  end

  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    books = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(books.id)
  end

  def destroy
    books = Book.find(params[:id])
    books.destroy
    redirect_to '/books'
  end



  private
  def books_params
    params.require(:books).permit(:title, :body)
  end
end
