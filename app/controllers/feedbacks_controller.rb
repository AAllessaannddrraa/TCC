# app/controllers/feedbacks_controller.rb
class FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[show edit update destroy]
  before_action :require_login # Proteção de login

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
      flash[:success] = 'Feedback criado com sucesso.'
      redirect_to @feedback
    else
      flash.now[:danger] = 'Erro ao criar feedback.'
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
    flash[:success] = 'Feedback excluído com sucesso.'
    redirect_to feedbacks_url
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:nivel_satisfacao, :cuidador_id, :paciente_id, :comentarios)
  end
end
