class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: "products/index"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end

  def create
    @product = Product.create(
      name: "Lord of the Rings",
      price: 19.99,
      image_url: "https://imgur.com/lotr.png",
      description: "One volume of Lord of the Rings by JRR Tolkien",
    )
    render template: "products/show"
  end
end
