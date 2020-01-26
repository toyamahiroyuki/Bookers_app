class BooksController < ApplicationController
before_action :authenticate_user!
  def new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if  @book.save
  		flash[:notice] = "投稿に成功しました(successfully)"
	  	redirect_to book_path(@book)
	  else
		@books = Book.all
		@user = current_user
	    render action: :index
	  end
  end

  def index
  	@book = Book.new
  	@books = Book.all
  	@user = current_user
  end

  def show
  	@book = Book.new
    @booker = Book.find(params[:id])
    @user = User.find(@booker.user_id)

  end

  def edit
  	@book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def update
  	@book = Book.find(params[:id])
  	if  @book.update(book_params)
  		flash[:notice] = "投稿に成功しました(successfully)"
	  	redirect_to book_path(@book)
  	else
  		render action: :edit
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
    flash[:notice] = "投稿が削除されました(successfully)"
  	redirect_to books_path
  end

private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
 end
