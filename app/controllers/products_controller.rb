class ProductsController < ApplicationController
  def get_all_products
    products = Product.all
    render json: products.as_json
  end

  def get_one_product
    product = Product.find(1)
    render json: product.as_json
  end

  def get_another_product
    product = Product.second
    render json: product.as_json
  end
end
