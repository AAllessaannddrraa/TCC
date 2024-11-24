# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_usuario!

  helper_method :current_usuario, :usuario_logado?

  def current_usuario
    @current_usuario ||= Usuario.find_by(id: session[:usuario_id]) if session[:usuario_id]
  end

  def usuario_logado?
    !!current_usuario
  end

  def exigir_login
    unless usuario_logado?
      flash[:alert] = 'Você precisa estar logado para acessar esta página.'
      redirect_to new_usuario_session_path
    end
  end

  def exigir_administrador
    unless current_usuario&.admin?
      flash[:alert] = 'Acesso restrito a administradores.'
      redirect_to root_path
    end
  end

  private

  # Restrict access to admins only
  def ensure_admin
    unless current_usuario&.admin?
      flash[:alert] = "Acesso negado! Apenas administradores podem acessar esta área."
      redirect_to root_path
    end
  end

  # Restrict access to caregivers only
  def ensure_cuidador
    unless current_usuario&.cuidador?
      flash[:alert] = "Acesso negado! Apenas cuidadores podem acessar esta área."
      redirect_to root_path
    end
  end

  # Restrict access to clients only
  def ensure_cliente
    unless current_usuario&.cliente?
      flash[:alert] = "Acesso negado! Apenas clientes podem acessar esta área."
      redirect_to root_path
    end
  end

  # Redirect users to their specific dashboards after login
  def after_sign_in_path_for(resource)
    case resource.role
    when "admin"
      admin_dashboard_path
    when "cuidador"
      caregiver_dashboard_path
    when "cliente"
      client_dashboard_path
    else
      root_path
    end
  end
end
