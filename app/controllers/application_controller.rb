# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_usuario, :usuario_logado?

  def current_usuario
    @current_usuario ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end

  def usuario_logado?
    !!current_usuario
  end

  def exigir_login
    unless usuario_logado?
      flash[:alert] = 'Você precisa estar logado para acessar esta página.'
      redirect_to login_path
    end
  end

  def exigir_administrador
    unless current_usuario&.administrador?
      flash[:alert] = 'Acesso restrito a administradores.'
      redirect_to root_path
    end
  end
end
