class LikesController < ApplicationController
  before_action :require_login
  def new
  end
  def create
    @user=current_user
    @idea=Idea.find(params[:id])
    @like=Like.create(user_id:session[:user_id], idea: Idea.find(params[:id]))
    if @like.save
      @user.id=session[:user_id]
      redirect_to "/users/#{@user.id}"
    else    
      flash[:errors]=@like.errors.full_messages
      redirect_to "/users/#{@user.id}"
    end
  end
end
