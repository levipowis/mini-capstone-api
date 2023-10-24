class ProductsController < ApplicationController
  def get_all_products
    products = Product.all
    render json: products.as_json
  end
end
