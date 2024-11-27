module Admin
  class UsuariosController < ApplicationController
    before_action :ensure_admin

    def index
      @usuarios = Usuario.all
    end

    def show
      @usuario = Usuario.find(params[:id])
    end

    def destroy
      @usuario = Usuario.find(params[:id])
      @usuario.destroy
      redirect_to admin_usuarios_path
    end

    private

    def ensure_admin
      # Lógica para garantir que o usuário é um administrador
    end
  end
end
