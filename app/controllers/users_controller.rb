class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def profile
      @user = User.find_by(id: params[:id])  # Usa find_by para evitar una excepción si no encuentra el usuario
  
      if @user
        @posts = @user.posts  # Cargar las publicaciones del usuario
      else
        redirect_to root_path, alert: "Usuario no encontrado"  # Redirige si no encuentra el usuario
      end
    end
  end
  