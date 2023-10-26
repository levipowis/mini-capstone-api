Rails.application.routes.draw do
  # long way
  get "/products" => "products#index"
  # short way
  get "/products/:id" => "products#show"
end
