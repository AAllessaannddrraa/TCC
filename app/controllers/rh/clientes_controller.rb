module Rh
  class ClientesController < ApplicationController
    before_action :set_cliente, only: [:update_status]

    def index
      @clientes = Cliente.all
    end

    def update_status
      if params[:status].in?(%w[cadastro_em_andamento aprovado reprovado])
        @cliente.update!(status: params[:status])
        flash[:success] = "Status do cliente atualizado para #{@cliente.status}."
      else
        flash[:error] = "Permissão negada para alterar para este status."
      end
      redirect_to rh_clientes_path
    end

    private

    def set_cliente
      @cliente = Cliente.find(params[:id])
    end
  end
end
