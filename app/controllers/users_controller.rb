class UsersController < ApplicationController

  def new
  end

  def profile
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



  private
  def set_user
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
  end

  def user_params
    params.expect(post: [ :title, :content, :user_id ])
  
  end
end