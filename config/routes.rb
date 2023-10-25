Rails.application.routes.draw do
  get "/all_products", controller: "products", action: "get_all_products"
  get "/one_product/:id", controller: "products", action: "get_one_product"
end
