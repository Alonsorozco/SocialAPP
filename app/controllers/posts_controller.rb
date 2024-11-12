class PostsController < ApplicationController
    
    before_action :set_post, only: %i[show edit update destroy]
    
  
    def index
      @posts = Post.all
    end
  
    def show
    end
  
    def new
      @post = current_user.posts.build
    end
  
    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to user_profile_path(current_user), notice: 'Publicación creada con éxito.'
      else
        render :new
      end
    end
  
    def edit; end
  
    def update
      if @post.update(post_params)
        redirect_to user_path(current_user), notice: 'Publicación actualizada con éxito.'
      else
        render :edit
      end
    end
  
    # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end
      
  
    private
  
    
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.expect(post: [ :title, :content, :user_id ])
  end
  
    def correct_user
      redirect_to root_path, alert: 'No autorizado.' unless @post.user == current_user
    end
  end
  