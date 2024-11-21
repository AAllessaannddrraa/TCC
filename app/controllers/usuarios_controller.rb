
class UsuariosController < ApplicationController
  before_action :authenticate_usuario!, only: [:edit, :update]

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      redirect_to root_path, notice: 'Usuário cadastrado com sucesso.'
    else
      render :new
    end
  end

  def edit
    @usuario = current_usuario
  end

  def update
    @usuario = current_usuario
    if @usuario.update(usuario_params)
      redirect_to perfil_path, notice: 'Perfil atualizado com sucesso.'
    else
      render :edit
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:email, :password, :password_confirmation, :nome)
  end
end
