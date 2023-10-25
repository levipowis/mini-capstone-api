class ProductsController < ApplicationController
  def get_all_products
    products = Product.all
    render json: products.as_json
  end

  def get_one_product
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end
end
