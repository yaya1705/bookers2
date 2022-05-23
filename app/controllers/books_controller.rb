class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :correct_user, only: [:edit, :update]
  def show
   @book_show =Book.find(params[:id])
  #投稿したものを１件取り出す 
   @user = @book_show.user
  #@book.userは投稿したその人
  @book = Book.new
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
    if @book.save
       redirect_to book_path(@book),notice: 'You have created book successfully.'
    else
      @books = Book.all
      @user = current_user
      render :index
      # createするときに何も情報持たないからindexで定義したものをここで同じように定義する必要がある。
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book.id),notice: 'You have updated book successfully.'
    elsif
     render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to books_path unless @user == current_user
  end
  
end
