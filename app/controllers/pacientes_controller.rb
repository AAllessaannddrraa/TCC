class PacientesController < ApplicationController
  before_action :set_paciente, only: %i[show edit update destroy]

  def index
    @pacientes = Paciente.all
  end

  def show
  end

  def new
    @paciente = Paciente.new
  end

  def create
    @paciente = Paciente.new(paciente_params)
    if @paciente.save
      redirect_to @paciente, notice: 'Paciente criado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @paciente.update(paciente_params)
      redirect_to @paciente, notice: 'Paciente atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @paciente.destroy
    redirect_to pacientes_url, notice: 'Paciente excluído com sucesso.'
  end

  private

  def set_paciente
    @paciente = Paciente.find(params[:id])
  end

  def paciente_params
    params.require(:paciente).permit(:nome, :idade, :genero, :endereco, :numero_contato, :email, :historico_medico, :alergias, :medicamentos, :preferencias, :contatos_familiares)
  end
end
class PacientesController < ApplicationController
  before_action :set_paciente, only: %i[show edit update destroy]

  def index
    @pacientes = Paciente.all
  end

  def show
  end

  def new
    @paciente = Paciente.new
  end

  def create
    @paciente = Paciente.new(paciente_params)
    if @paciente.save
      redirect_to @paciente, notice: 'Paciente criado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @paciente.update(paciente_params)
      redirect_to @paciente, notice: 'Paciente atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @paciente.destroy
    redirect_to pacientes_url, notice: 'Paciente excluído com sucesso.'
  end

  private

  def set_paciente
    @paciente = Paciente.find(params[:id])
  end

  def paciente_params
    params.require(:paciente).permit(:nome, :numero_contato, :idade, :endereco)
  end
end
