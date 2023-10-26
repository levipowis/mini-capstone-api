Rails.application.routes.draw do
  # index route/action
  get "/products" => "products#index"
  # show route/action
  get "/products/:id" => "products#show"
  # create route/action
  post "/products" => "products#create"
end
