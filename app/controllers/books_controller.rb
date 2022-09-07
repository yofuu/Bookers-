class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def create
    @books =Book.new(books_params)
    redirect_to new_book_path(books.id)
    if @book.save
      redirect_to admin_book_path(@book), notice:"Book was successfully created."
    else
      render :new
    end
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
    params.require(:books).permit(:title, :body)
  end
end
