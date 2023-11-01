class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render :index
  end

  def show
    @suppliers = Supplier.find_by(id: params["id"])
    render :show
  end
end
