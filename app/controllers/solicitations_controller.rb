
class SolicitationsController < ApplicationController
  before_action :authenticate_usuario!

  # List all solicitations (admin view or user's own requests)
  def index
    if current_usuario.admin?
      # Notify the client about the status change
      message = params[:status] == "aprovado" ? "Sua solicitação foi aprovada." : "Sua solicitação foi rejeitada."
      @solicitation.cliente.notify(message)

      @solicitations = Solicitation.all
    else
      @solicitations = current_usuario.solicitations
    end
  end

  # Approve or reject a solicitation (admin action)
  def update
    @solicitation = Solicitation.find(params[:id])
    if current_usuario.admin?
      # Notify the client about the status change
      message = params[:status] == "aprovado" ? "Sua solicitação foi aprovada." : "Sua solicitação foi rejeitada."
      @solicitation.cliente.notify(message)

      @solicitation.update(status: params[:status])
      message = params[:status] == "aprovado" ? "Solicitação aprovada com sucesso." : "Solicitação rejeitada com sucesso."
      flash[:notice] = message
    else
      flash[:alert] = "Você não tem permissão para realizar esta ação."
    end
    redirect_to solicitations_path
  end
end
