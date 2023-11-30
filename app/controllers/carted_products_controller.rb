class CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render :index
  end

  def create
    @carted_products = CartedProduct.create(
      user_id: current_user.id,
      order_id: nil,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
    )
    render json: @carted_products.as_json
  end
end
