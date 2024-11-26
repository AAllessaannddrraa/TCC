module Admin
  class UsuariosController < ApplicationController
    def index
      @usuarios = Usuario.all
    end

    def show
      @usuario = Usuario.find(params[:id])
    end

    def destroy
      @usuario = Usuario.find(params[:id])
      @usuario.destroy
      redirect_to admin_usuarios_path, notice: 'Usuário deletado com sucesso.'
    end
  end
end
