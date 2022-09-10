class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def create
    @book =Book.new(books_params)

    if @book.save
      redirect_to book_path(@book), notice:"Book was successfully created."
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to admin_book_path(@book.id), notice:"Book was successfully created."
    else
    render:edit
    end
  end

  def destroy
    books = Book.find(params[:id])
    books.destroy
    redirect_to '/books'
  end



  private
  def books_params
    params.require(:book).permit(:title, :body)
  end
end
