class PagamentosController < ApplicationController
  before_action :set_pagamento, only: %i[show edit update destroy]
  before_action :authenticate_usuario!

  def index
    @pagamentos = Pagamento.all
  end

  def new
    @pagamento = Pagamento.new
  end

  def create
    @pagamento = Pagamento.new(pagamento_params)
    if @pagamento.save
      redirect_to pagamentos_path, notice: "Pagamento realizado com sucesso."
    else
      render :new
    end
  end

  def destroy
    @pagamento.destroy
    redirect_to pagamentos_path, notice: "Pagamento removido."
  end

  private

  def set_pagamento
    @pagamento = Pagamento.find(params[:id])
  end

  def pagamento_params
    params.require(:pagamento).permit(:valor, :status, :cliente_id, :servico_id)
  end
end
