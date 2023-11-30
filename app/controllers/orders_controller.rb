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
    carted_products = current_user.carted_products.where(status: "carted")

    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    calculated_tax = calculated_subtotal * 0.07
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.create(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    render json: @order.as_json
  end

  if @order.valid?
    carted_products.update_all(status: "purchased", order_id: @order.id)
    render :show
  else
    render json: { errors: @order.errors.full_messages }, status: 422
  end
end
