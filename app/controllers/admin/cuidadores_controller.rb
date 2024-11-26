module Admin
  class CuidadoresController < ApplicationController
    before_action :set_cuidador, only: [:update_status]

    def index
      @cuidadores = Cuidador.all.group_by(&:status)
    end

    # Atualizar status pelo Admin ou Supervisora
    def update_status
      if params[:status].in?(%w[ativo inativo em_pausa demitido])
        @cuidador.update!(status: params[:status])
        flash[:success] = "Status atualizado para #{@cuidador.status}."
      else
        flash[:error] = "Permissão negada para alterar para este status."
      end
      redirect_to admin_cuidadores_path
    end

    private

    def set_cuidador
      @cuidador = Cuidador.find(params[:id])
    end
  end
end
