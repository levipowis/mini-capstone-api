class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all
    render :index

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
      render :index
    end
  end

  def show
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end

  def create
    @product = Product.create(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      inventory: params["inventory"],
      supplier_id: params["supplier_id"],
    )
    if @product.valid?
      Image.create(url: params["image_url"], product_id: @product.id)
      render template: "products/show"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.update(
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      description: params["description"] || @product.description,
      inventory: params["inventory"] || @product.inventory,
      supplier_id: params["supplier_id"] || @product.supplier_id,
    )
    if @product.valid?
      render template: "products/show"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    render json: { message: "Product successfully destroyed..." }
  end
end
