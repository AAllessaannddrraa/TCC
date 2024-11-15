# app/controllers/usuarios_controller.rb
class UsuariosController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_login, except: %i[new create]

  def index
    @usuarios = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Usuário criado com sucesso!'
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Usuário atualizado com sucesso!'
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'Usuário excluído com sucesso.'
    redirect_to usuarios_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nome, :email, :senha, :papel)
  end

  def require_login
    return if logged_in?

      flash[:danger] = 'Por favor, faça login.'
      redirect_to login_url
  end
end
