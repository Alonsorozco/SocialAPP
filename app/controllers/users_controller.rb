class UsersController < ApplicationController
  before_action :set_user, only: [:profile, :edit, :update, :destroy]
  def new
  end

  def profile
    
    @user = User.find(params[:id])
    @posts = @user.posts 
  end

  def edit
  end

  def update
    respond_to do |format|
        if @user.update(user_params)
            format.js { render nothing: true, notice: 'El bookmark se ha actualizado!' }
        else
            format.html { redirect_to edit_user_path, notice: 'El bookmark no se ha actualizado' }
        end
    end
  end

  def create
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
    @posts = Post.find(params[:id])
  end

  def user_params
    params.expect(post: [ :title, :content, :user_id ])
    params.expect(user: [ :id ])
  end
end