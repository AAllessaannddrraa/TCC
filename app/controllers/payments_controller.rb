
class Financeiro::PaymentsController < ApplicationController
  before_action :authenticate_usuario!
  before_action :ensure_financeiro

  def index
    @payments = Payment.all
  end

  def audit
    # Implementar lógica de auditoria
  end

  private

  def ensure_financeiro
    redirect_to root_path, alert: "Acesso negado!" unless current_usuario&.financeiro?
  end
end
