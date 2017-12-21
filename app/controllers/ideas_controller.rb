class IdeasController < ApplicationController
  before_action :require_login
  def new
    @idea=Idea.find(params[:id])
    @user=@idea.users.group(:id)
    @curuser=current_user
  end

  def show
    @user = User.find(params[:id])
    @ideas = Idea.where(user_id: @user.id).count
    @likes = Like.where(user_id: @user.id).count
  end

  def create
    @user=current_user
    @idea=Idea.create(content: params[:content], user_id:session[:user_id])
    if @idea.save
      @user.id=session[:user_id]
      redirect_to "/users/#{@user.id}"
    else    
      flash[:errors]=@idea.errors.full_messages
      redirect_to "/users/#{@user.id}"
    end
  end

  def destroy
    Idea.find(params[:id]).destroy
  	redirect_to :back
  end

end
