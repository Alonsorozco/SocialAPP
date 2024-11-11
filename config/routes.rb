Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }
  
  resources :posts


  # Agrega `:show` al recurso `users` para habilitar la vista de perfil de cada usuario
  resources :users, only: [:show] 

  # Ruta personalizada para el perfil del usuario actual
  get 'profile/:id', to: 'users#profile', as: :user_profile

  root "user#login"
end
