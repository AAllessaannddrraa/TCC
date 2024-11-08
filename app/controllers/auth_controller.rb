class AuthController < ApplicationController
  def new
    # Página de login
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:senha])
      log_in user
      redirect_to root_path, notice: 'Login realizado com sucesso!'
    else
      flash.now[:alert] = 'Email ou senha inválidos.'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path, notice: 'Logout realizado com sucesso.'
  end
end
