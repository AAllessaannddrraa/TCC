module Cuidadores
  class TurnosController < ApplicationController
    before_action :ensure_cuidador

    def index
      @turnos = current_usuario.turnos
    end

    def update
      @turno = Turno.find(params[:id])
      if @turno.update(turno_params)
        redirect_to cuidadores_turnos_path, notice: "Turno atualizado com sucesso."
      else
        redirect_to cuidadores_turnos_path, alert: "Erro ao atualizar turno."
      end
    end

    private

    def ensure_cuidador
      redirect_to root_path unless current_usuario.cuidador?
    end

    def turno_params
      params.require(:turno).permit(:status)
    end
  end
end
