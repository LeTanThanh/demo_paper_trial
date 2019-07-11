Rails.application.routes.draw do
  root "posts#index"

  resources :posts, only: %i(show update) do
    member do
      patch :restore
    end
  end
end
