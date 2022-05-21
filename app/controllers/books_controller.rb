class BooksController < ApplicationController
  def show
   @book =Book.find(params[:id])
  #投稿したものを１件取り出す 
   @user = @book.user
  #@book.userは投稿したその人
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to users_path
    
  end
  

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
