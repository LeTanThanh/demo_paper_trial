Rails.application.routes.draw do
  root "posts#index"

  resources :posts, only: %i(show update)
end
