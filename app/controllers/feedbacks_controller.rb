# app/controllers/feedbacks_controller.rb
class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
    @feedbacks = Feedback.all
  end

  def show
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      redirect_to @feedback, notice: 'Feedback criado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @feedback.update(feedback_params)
      redirect_to @feedback, notice: 'Feedback atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @feedback.destroy
    redirect_to feedbacks_url, notice: 'Feedback deletado com sucesso.'
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:comentario, :avaliacao, :usuario_id, :servico_id)
  end
end
