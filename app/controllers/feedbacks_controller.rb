# app/controllers/feedbacks_controller.rb
class FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[show destroy]
  before_action :authenticate_usuario!

  def index
    @feedbacks = Feedback.all
  end

  def show; end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      redirect_to feedbacks_path, notice: "Feedback enviado com sucesso."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @feedback.update(feedback_params)
      flash[:success] = 'Feedback atualizado com sucesso.'
      redirect_to @feedback
    else
      flash.now[:danger] = 'Erro ao atualizar feedback.'
      render :edit
    end
  end

  def destroy
    @feedback.destroy
    redirect_to feedbacks_path, notice: "Feedback removido."
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:avaliacao, :comentario, :cuidador_id, :cliente_id)
  end
end
