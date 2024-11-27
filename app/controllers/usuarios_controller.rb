class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  def index
    @usuarios = Usuario.all
  end

  def show
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      redirect_to @usuario, notice: 'Usuário criado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @usuario.update(usuario_params)
      redirect_to @usuario, notice: 'Usuário atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @usuario.destroy
    redirect_to usuarios_url, notice: 'Usuário deletado com sucesso.'
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:nome, :email, :password, :password_confirmation)
  end
end
