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
