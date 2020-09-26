class BooksController < ApplicationController


# form_withが空っぽであればcreateが起動する
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have createed book successfully.."
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render action: :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully.."
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render action: :edit
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    render action: :edit
    else
    redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def index
    @book  = Book.new
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @user = @books.user
  end


  private
  def profile_image_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  private
  def book_params
    params.require(:book).permit(:title,:body,:user_id)
  end

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
  end

end
