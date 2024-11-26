module Supervisora
  class ApoiosController < ApplicationController
    before_action :ensure_supervisora

    def index
      @apoios = Servico.where(status: :pendente)
    end

    def update
      @apoio = Servico.find(params[:id])
      if params[:status].present?
        @apoio.update!(status: params[:status])
        redirect_to supervisora_apoios_path, notice: "Apoio atualizado com sucesso."
      else
        redirect_to supervisora_apoios_path, alert: "Status inválido."
      end
    end

    private

    def ensure_supervisora
      redirect_to root_path unless current_usuario.supervisora?
    end

    def apoio_params
      params.require(:servico).permit(:status)
    end
  end
end
