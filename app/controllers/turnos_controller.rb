# app/controllers/turnos_controller.rb
class TurnosController < ApplicationController
  before_action :set_turno, only: %i[show edit update destroy]
  before_action :require_login # Adicionando proteção de login para acesso

  def index
    @turnos = Turno.all
  end

  def show; end

  def new
    @turno = Turno.new
  end

  def create
    @turno = Turno.new(turno_params)
    if @turno.save
      flash[:success] = 'Turno criado com sucesso.'
      redirect_to @turno
    else
      flash.now[:danger] = 'Erro ao criar turno. Verifique os campos.'
      render :new
    end
  end

  def edit; end

  def update
    if @turno.update(turno_params)
      flash[:success] = 'Turno atualizado com sucesso.'
      redirect_to @turno
    else
      flash.now[:danger] = 'Erro ao atualizar turno.'
      render :edit
    end
  end

  def destroy
    @turno.destroy
    flash[:success] = 'Turno excluído com sucesso.'
    redirect_to turnos_url
  end

  private

  def set_turno
    @turno = Turno.find(params[:id])
  end

  def turno_params
    params.require(:turno).permit(:data, :hora_inicio, :hora_fim, :cuidador_id, :paciente_id)
  end
end
