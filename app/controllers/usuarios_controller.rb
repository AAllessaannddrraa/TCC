# app/controllers/usuarios_controller.rb
class UsuariosController < ApplicationController
  before_action :encontrar_usuario, only: [:mostrar, :editar, :atualizar, :destruir]
  before_action :exigir_login, except: [:novo, :criar]

  def index
    @usuarios = Usuario.all
  end

  def mostrar
  end

  def novo
    @usuario = Usuario.new
  end

  def criar
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      flash[:notice] = 'Usuário criado com sucesso. Aguardando aprovação do administrador.'
      redirect_to usuarios_path
    else
      flash[:alert] = 'Erro ao criar usuário.'
      render :novo
    end
  end

  def editar
  end

  def atualizar
    if @usuario.update(usuario_params)
      flash[:notice] = 'Perfil atualizado com sucesso.'
      redirect_to @usuario
    else
      flash[:alert] = 'Erro ao atualizar o perfil.'
      render :editar
    end
  end

  def destruir
    @usuario.destroy
    flash[:notice] = 'Usuário removido com sucesso.'
    redirect_to usuarios_path
  end

  private

  def encontrar_usuario
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:nome, :email, :password, :role)
  end
end
