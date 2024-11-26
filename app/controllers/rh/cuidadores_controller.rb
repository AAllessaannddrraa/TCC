module Rh
  class CuidadoresController < ApplicationController
    before_action :ensure_rh

    def index
      @cuidadores = Cuidador.where(status: :cadastro_em_andamento)
    end

    def update
      @cuidador = Cuidador.find(params[:id])
      if params[:status].present?
        @cuidador.update!(status: params[:status])
        redirect_to rh_cuidadores_path, notice: "Cuidador atualizado com sucesso."
      else
        redirect_to rh_cuidadores_path, alert: "Status inválido."
      end
    end

    private

    def ensure_rh
      redirect_to root_path unless current_usuario.rh?
    end
  end
end
