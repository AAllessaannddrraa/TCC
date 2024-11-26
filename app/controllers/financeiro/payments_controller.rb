module Financeiro
  class PaymentsController < ApplicationController
    before_action :ensure_financeiro

    def index
      @payments = Payment.all
    end

    def show
      @payment = Payment.find(params[:id])
    end

    private

    def ensure_financeiro
      redirect_to root_path unless current_usuario.financeiro?
    end
  end
end
