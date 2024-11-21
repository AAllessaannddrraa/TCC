
class PaymentsController < ApplicationController
  before_action :authenticate_usuario!

  # List all payments (admin view)
  def index
    @payments = Payment.all
  end

  # New payment form (client view)
  def new
    @payment = Payment.new
    @solicitation = Solicitation.find(params[:solicitation_id])
  end

  # Create a new payment (client action)
  def create
    @payment = Payment.new(payment_params)
    @payment.solicitation = Solicitation.find(params[:solicitation_id])

    if @payment.save
      flash[:notice] = "Pagamento realizado com sucesso!"
      redirect_to payments_path
    else
      flash[:alert] = "Erro ao processar o pagamento."
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:valor, :metodo_pagamento)
  end
end
