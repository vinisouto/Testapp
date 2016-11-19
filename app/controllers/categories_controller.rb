class CategoriesController < ApplicationController

  def index

    categories = %w(shoes home fruits)
    @categories = Category.all
  end

  def show
    @posts = Post.new
    @post = Post.all
  end



    def new
        @category = Category.new
        @post = Post.new
    end

    def edit
        @category = Category.find(params[:id])
    end

    def create
      @category = Category.new(category_params)

      @category.save
      #redirect_to @category
    end

    def update
      @category = Category.find(params[:id])

      #if @category.update(params[:category].permit(:category_params))
      #  redirect_to @category
      #else
      #  render 'edit'
      #end
    end


    end

    private
      def category_params
        params.require(:category).permit(:name)
      end

