class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    # @comments = Product.find(params[:id]).comments
    @comments = Comment.where(product_id: params[:id])
  end

  def new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(name:params[:name], description:params[:description], pricing:params[:pricing], category_id:params[:category])
    if @product.save
      redirect_to '/products'
    else
      errors = @product.errors
      flash[:name_error] = errors['name'].join(", ").capitalize
      flash[:description_error] = errors['description'].join(", ").capitalize
      flash[:pricing_error] = errors['pricing'].join(", ").capitalize
      redirect_to '/products/new'
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:name]
    @product.description = params[:description]
    @product.pricing = params[:pricing]
    @product.category_id = params[:category]
    if @product.save
      redirect_to '/products'
    else
      errors = @product.errors
      flash[:name_error] = errors['name'].join(", ").capitalize
      flash[:description_error] = errors['description'].join(", ").capitalize
      flash[:pricing_error] = errors['pricing'].join(", ").capitalize
      redirect_to "/products/#{@product.id}/edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to '/products'
  end

end
