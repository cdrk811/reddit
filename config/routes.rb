Rails.application.routes.draw do
  devise_for :accounts
  root to: "public#index"

  resources :communities, except: %i[update destroy] do
    resources :posts, except: :destroy
  end
end
