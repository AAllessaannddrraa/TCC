class PagamentosController < ApplicationController
  before_action :set_pagamento, only: [:show, :edit, :update, :destroy]

  def index
    @pagamentos = Pagamento.all
  end

  def show
  end

  def new
    @pagamento = Pagamento.new
  end

  def edit
  end

  def create
    @pagamento = Pagamento.new(pagamento_params)
    if @pagamento.save
      redirect_to @pagamento, notice: 'Pagamento criado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @pagamento.update(pagamento_params)
      redirect_to @pagamento, notice: 'Pagamento atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @pagamento.destroy
    redirect_to pagamentos_url, notice: 'Pagamento deletado com sucesso.'
  end

  private

  def set_pagamento
    @pagamento = Pagamento.find(params[:id])
  end

  def pagamento_params
    params.require(:pagamento).permit(:valor, :data, :cliente_id, :servico_id)
  end
end
