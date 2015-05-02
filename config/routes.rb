Rails.application.routes.draw do
  get 'users/new'

  root 'static_pages#home'
  get 'home' => 'static_pages#home'

  get 'help' => 'static_pages#help'

  get 'about' => 'static_pages#about'

  get 'contact' => 'static_pages#contact'
  get 'scholars/new'
  get 'signup' => 'users#new'
  resources :microposts
  resources :scholars
  resources :users
  
end
