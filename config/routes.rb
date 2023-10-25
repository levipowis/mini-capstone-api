Rails.application.routes.draw do
  get "/all_products", controller: "products", action: "get_all_products"
  get "/one_product", controller: "products", action: "get_one_product"
  get "another_product", controller: "products", action: "get_another_product"
end
