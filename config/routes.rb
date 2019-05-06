Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#index'
  get 'sign_up', to: 'users#new'
  resources :users
  resources :forms do 
   resources :questions
  end
end
