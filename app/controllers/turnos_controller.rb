# app/controllers/turnos_controller.rb
class TurnosController < ApplicationController
  before_action :set_turno, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  def index
    @turnos = Turno.all
  end

  def show
  end

  def new
    @turno = Turno.new
  end

  def create
    @turno = Turno.new(turno_params)
    if @turno.save
      redirect_to @turno, notice: 'Turno criado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @turno.update(turno_params)
      redirect_to @turno, notice: 'Turno atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @turno.destroy
    redirect_to turnos_url, notice: 'Turno deletado com sucesso.'
  end

  private

  def set_turno
    @turno = Turno.find(params[:id])
  end

  def turno_params
    params.require(:turno).permit(:data_inicio, :data_fim, :status, :cuidador_id, :paciente_id)
  end
end
