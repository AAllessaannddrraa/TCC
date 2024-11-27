module Admin
  class ReportsController < ApplicationController
    before_action :ensure_admin

    def index
      @reports = Report.all
    end

    def show
      @report = Report.find(params[:id])
    end

    private

    def ensure_admin
      # Lógica para garantir que o usuário é um administrador
    end
  end
end
