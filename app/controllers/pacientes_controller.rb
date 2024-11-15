# app/controllers/pacientes_controller.rb
class PacientesController < ApplicationController
  before_action :set_paciente, only: %i[show edit update destroy]
  before_action :require_login # Proteção de login

  def index
    @pacientes = Paciente.all
  end

  def show; end

  def new
    @paciente = Paciente.new
  end

  def create
    @paciente = Paciente.new(paciente_params)
    if @paciente.save
      flash[:success] = 'Paciente criado com sucesso.'
      redirect_to @paciente
    else
      flash.now[:danger] = 'Erro ao criar paciente. Verifique os campos.'
      render :new
    end
  end

  def edit; end

  def update
    if @paciente.update(paciente_params)
      flash[:success] = 'Paciente atualizado com sucesso.'
      redirect_to @paciente
    else
      flash.now[:danger] = 'Erro ao atualizar paciente.'
      render :edit
    end
  end

  def destroy
    @paciente.destroy
    flash[:success] = 'Paciente excluído com sucesso.'
    redirect_to pacientes_url
  end

  private

  def set_paciente
    @paciente = Paciente.find(params[:id])
  end

  def paciente_params
    params.require(:paciente).permit(:nome, :idade, :genero, :endereco, :numero_contato, :email, :historico_medico,
                                     :alergias, :medicamentos, :preferencias, :contatos_familiares)
  end
end
