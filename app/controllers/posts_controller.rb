class PostsController < ApplicationController

  def new
    @post = current_user.posts.build
   @comments = Comment.new
    # @categories = %w(shoes home fruits)
    # @categories = Category.all



  end

  def index
    @posts = Post.includes(:user).all
    @posts = Post.all.order("created_at DESC")

  end

  def show
     @post = Post.find(params[:id])
    @comments = Comment.new
    @comments = Comment.where(post_id: @post)
     # @comments.post = @post
     @comments = Comment.all

  end

   def create
    @post = current_user.posts.build(permit_post)
    if @post.save
      flash[:sucess] = "sucess!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path

    end
end
    def upvote


           @post = Post.find(params[:id])
         @post.upvote_by current_user
          redirect_to post_path
       # Post.increment_counter(:upvote, params[:id])
      # @post.upvote_by current_user
      # redirect_to :back

   end




  private
  def permit_post
    params.require(:post).permit(:image, :description)
  end
end


