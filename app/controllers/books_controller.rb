class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book)
    else
    @books = Book.all
    render :index
    end
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
  	@book_new = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id == crrent_user.id
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
