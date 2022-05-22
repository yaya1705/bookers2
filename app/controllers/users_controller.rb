class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    #@user.booksでユーザーが投稿したもの
    # モデルにアソシエーションの記述があるのでこの書き方ができる
    # https://pikawaka.com/rails/associationを参照
  end

  def edit
    @user = User.find(params[:id])
    
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id),notice: 'You have updated user successfully.'
    else
     render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction,)
  end
  
  def correct_user
      @user = User.find(params[:id])
      redirect_to user_path() unless @user == current_user
    end
  
end
