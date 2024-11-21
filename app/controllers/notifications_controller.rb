
class NotificationsController < ApplicationController
  before_action :authenticate_usuario!

  # Mark a notification as read
  def update
    @notification = Notification.find(params[:id])
    if @notification.update(status: params[:status])
      flash[:notice] = "Notificação atualizada com sucesso."
    else
      flash[:alert] = "Erro ao atualizar notificação."
    end
    redirect_to root_path
  end
end
