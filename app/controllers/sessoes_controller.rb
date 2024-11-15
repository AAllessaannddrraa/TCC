# app/controllers/sessoes_controller.rb
class SessoesController < ApplicationController
  def new
    # Página de login
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:senha])
      log_in user
      flash[:success] = 'Login realizado com sucesso!'
      redirect_to root_path
    else
      flash.now[:danger] = 'Combinação de email/senha inválida'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'Logout realizado com sucesso.'
    redirect_to root_url
  end
end
