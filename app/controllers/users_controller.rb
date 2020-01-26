class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  	@book = Book.new
  	@user = current_user
  	@users = User.all
  end
  def show
  	@book = Book.new
  	@user = User.find(params[:id])
  	@books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to new_user_session_path
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "投稿に成功しました(successfully)"
       redirect_to user_path(@user)
    else
       render action: :edit
    end
  end


private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
