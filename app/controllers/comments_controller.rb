class CommentsController < ApplicationController
# before_filter :get_products

def new

  @comments = @post.comments.new

  @comments = Comment.new
end

# def get_products

#   @posts = Post.find(params[:post_id])
# end


def index
  @comment = Comment.new(comments_params)

end
#    def create
#      @post = Post.where(:id => params[:post_id]).first
# unless @post.blank?
#   @comment = @post.comments.where(:id => params[:id]).first
#   unless @comment.blank?
#     @comment.destroy
#     flash[:notice] = "Comment deleted"
#     redirect_to post_path(@post)
#   else
#     flash[:notice] = "Comment not found"
#     redirect_to post_path(@post)
#   end
# end
# end


  def create

    @post = Post.find([post_url])
    @comment = Comment.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

# @comments = Comment.new(post_id: params[:post_id])
#   # @comments = @post.comments.create(params[:comment])
#    @comments = Comment.new(comments_params)
#    @comments.post = @post
#   if @comments.save !
#     redirect_to  post_comment_path(@post)
#   else
#     render 'new'
#   end
# end

  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.new(comments_params)
  #     @comment = @post.comments.build
  #   if @comment.save
  #     redirect_to post_path(@post)
  #   else
  #     render 'posts/show'
  #   end
  # end


  def find_post
    @post = Post.find(params[:post_id])
  end

    # @posts = Post.find(params[:post_id])
    # @comment = Comment.new(comment_params)
    # @comment.post = @post
    #  if @comment.save
    #   redirect_to post_path(@post)
    # else
    #   render 'posts/show'
    # end

     # @comments = @post.comments.new(params[:comment])
     # @comments = @product.comments.new(params[:comment])
      # puts params[:comments][:content]
      #  puts params[:comments][:text]

      # @comments.save
      #  redirect_to comments_path(@post)

#       def create
#   @post = Post.find(params[:post_id])
#   @comment = @post.comments.create(comment_params)
#   @comment.user_id = current_user.id #or whatever is you session name
#   if @comment.save
#     redirect_to @post
#   else
#     flash.now[:danger] = "error"
#   end
# end


  def show


@comments = Comment.new(comments_params)
@post = Post.find(params[:id])



    # @products = Product.find_by_id(params[:products_id])
  end


  # def create
  #    @comment = Comment.new(comment_params)
  #    @comment.products = @products
  #     if @comment.save
  #       redirect_to product_path(@products)
  #     else
  #       render '/products/:show'
  #     end
  #  end
   # def show
   #   @comments = Comment.find(params[:id])

   # end

    private

   def comments_params
     params.permit(:content, :text)
    end

end


