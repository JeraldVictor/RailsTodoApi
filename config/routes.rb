Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "todos#index"

  # get "/todos", to: "todos#index"
  # post "/todos", to: "todos#create"
  # get "/todos/:id", to: "todos#show"
  # put "/todos/:id/edit", to: "todos#update"
  # delete "/todos/:id", to: "todos#destroy"
  resources :todos
  resources :users
end
