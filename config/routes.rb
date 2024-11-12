Rails.application.routes.draw do
  devise_for :users


  resources :posts


  # Agrega `:show` al recurso `users` para habilitar la vista de perfil de cada usuario
  resources :users, only: [:show] 

  # Ruta personalizada para el perfil del usuario actual
  get 'profile/:id', to: 'users#profile', as: :user_profile
  root 'posts#index'
end
