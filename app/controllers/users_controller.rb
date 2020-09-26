class UsersController < ApplicationController

  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) && (@user == current_user)
    flash[:notice] = "You have updated book successfully.."
    redirect_to user_path(@user.id)
    else
    render action: :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    render action: :edit
    else
    redirect_to user_path(current_user)
    end
  end

  def index
   @book = Book.new
   @users = User.all
  end



  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

end
