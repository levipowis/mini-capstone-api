Rails.application.routes.draw do
  get "/all_products", controller: "products", action: "get_all_products"
end
