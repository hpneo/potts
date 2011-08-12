Potts::Application.routes.draw do
  devise_for :users do
    get 'sign_in', :to => 'devise/sessions#new'
  end

  resources :categories do
    resources :tasks
  end

  resources :users

  root :to => 'home#index'
end
