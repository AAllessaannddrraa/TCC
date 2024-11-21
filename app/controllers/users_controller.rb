
class UsersController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # List all users (admin view)
  def index
    @usuarios = Usuario.all
  end

  # Show user details
  def show
  end

  # Edit user details (admin or self)
  def edit
    unless current_usuario.admin? || current_usuario == @usuario
      redirect_to root_path, alert: "Acesso negado!"
    end
  end

  # Update user details
  def update
    if @usuario.update(usuario_params)
      redirect_to @usuario, notice: "Usuário atualizado com sucesso."
    else
      render :edit
    end
  end

  # Delete a user (admin only)
  def destroy
    if current_usuario.admin?
      @usuario.destroy
      redirect_to users_path, notice: "Usuário excluído com sucesso."
    else
      redirect_to root_path, alert: "Acesso negado!"
    end
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:nome, :email, :password, :role)
  end
end
