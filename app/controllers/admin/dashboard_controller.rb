module Admin
  class DashboardController < ApplicationController
    before_action :ensure_admin

    def index
      @usuarios = Usuario.all
    end

    private

    def ensure_admin
      # Lógica para garantir que o usuário é um administrador
    end
  end
end
