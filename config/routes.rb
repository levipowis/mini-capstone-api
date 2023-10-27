Rails.application.routes.draw do
  # index route/action
  get "/products" => "products#index"
  # show route/action
  get "/products/:id" => "products#show"
  # create route/action
  post "/products" => "products#create"
  # update route/action
  patch "/products/:id" => "products#update"
  # destroy route/action
  delete "/products/:id" => "products#destroy"
end
