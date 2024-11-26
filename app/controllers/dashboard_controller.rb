module Admin
  class DashboardController < ApplicationController
    before_action :ensure_admin

    def index
      @usuarios = Usuario.all
      @reports = Report.all
    end

    private

    def ensure_admin
      redirect_to root_path unless current_usuario.admin?
    end
  end
end

class AdminDashboardController < ApplicationController
  before_action :authenticate_usuario!
  before_action :ensure_admin

  def index
    @usuarios = Usuario.all
    @solicitations = Solicitation.all
  end

  private

  def ensure_admin
    redirect_to root_path, alert: "Acesso negado!" unless current_usuario&.admin?
  end
end

def admin_dashboard
  @relatorios = Relatorio.all
  @usuarios = Usuario.all
  @cuidadoras = Cuidadora.all
  render :admin_dashboard
end
