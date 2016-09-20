Rails.application.routes.draw do
  get 'static_pages/home'

  resources :system_suppliers
  devise_for :users

  root 'static_pages#home'

  resources :systems do
    collection { post :import }
  end

  resources :trusts do
    collection { post :import }
  end

  resources :reviews do
    collection { post :import }
    collection { get :compare }
  end

end
