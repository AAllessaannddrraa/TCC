module Clientes
  class ServicosController < ApplicationController
    before_action :ensure_cliente

    def index
      @servicos = current_usuario.servicos
    end

    def create
      @servico = current_usuario.servicos.build(servico_params)
      if @servico.save
        redirect_to clientes_servicos_path, notice: "Serviço solicitado com sucesso."
      else
        render :new
      end
    end

    private

    def ensure_cliente
      redirect_to root_path unless current_usuario.cliente?
    end

    def servico_params
      params.require(:servico).permit(:nome, :descricao, :preco, :tipo_servico_id, :data_agendamento)
    end
  end
end
