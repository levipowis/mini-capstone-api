Rails.application.routes.draw do
  # long way
  get "/all_products", controller: "products", action: "get_all_products"
  # short way
  get "/one_product/:id" => "products#get_one_product"
end
