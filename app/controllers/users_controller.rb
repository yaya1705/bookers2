class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    #@user.booksでユーザーが投稿したもの
    # モデルにアソシエーションの記述があるのでこの書き方ができる
    # https://pikawaka.com/rails/associationを参照
  end

  def edit
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
    
  end
end
