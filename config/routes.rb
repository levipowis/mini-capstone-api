Rails.application.routes.draw do
  # long way
  get "/products" => "products#index"
  # short way
  get "/product/:id" => "products#show"
end
