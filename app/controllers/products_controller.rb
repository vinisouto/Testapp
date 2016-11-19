class ProductsController < ApplicationController


  def new
        @product = Product.new


  end

  def show
    @products = Product.find(params[:id])
    @comments = Comment.new

  end

  def index
    @products = Product.all
     @comments = Comment.new

  end

   def edit
   @products = Product.find(params[:id])
end


   def create
    # remember current user
    @products = Product.new(permit_product)
      if @products.save
      flash[:sucess] = "sucess!"
      redirect_to product_path(@products)
    else

      @errors = @products.errors.full_messages

      redirect_to new_product_path
    end
       end



    private
  def permit_product
    params.require(:product).permit(:image, :description, :price, :name)
  end

end

# helpers

# link_to (âncora)
# image_tag (img)
# favicon_link_tag (link para favicon)
# stylesheet_link_tag (link para CSS)
# javascript_include_tag (script)
# index: exibe todos os items
# show: exibe um item específico
# new: formulário para a criação de um novo item
# create: cria um novo item
# edit: formulário para edição de um item
# update: atualiza um item existente
# destroy: remove um item existente


