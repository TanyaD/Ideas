class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
  end
  def create
    @user=User.new user_params
    if @user.save
      redirect_to "/users/#{@user.id}"
      session[:user_id]=@user.id
    else
      flash[:errors]=@user.errors.full_messages
      redirect_to "/users/new"
    end
  end
  def show
    @user=current_user
    @idea=Idea.all
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
