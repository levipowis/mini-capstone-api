class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = Order.all
    render json: @orders.as_json
  end

  def show
    @order = Order.find_by(id: params[:id])
    render json: @order.as_json
  end

  def create
    product = Product.find_by(id: params["product_id"])

    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.07
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    render json: @order.as_json
  end
end
