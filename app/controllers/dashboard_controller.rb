
class DashboardController < ApplicationController
  before_action :authenticate_usuario!
  before_action :ensure_admin, only: [:admin_dashboard]

  def admin_dashboard
    @solicitations_by_status = Solicitation.group(:status).count
    @total_payments = Payment.sum(:valor)
    @recent_combinations = Usuario.where(role: "cliente").where.not(cuidador_id: nil).limit(5)
  end

  private

  def ensure_admin
    redirect_to root_path, alert: "Acesso negado!" unless current_usuario.admin?
  end
end
