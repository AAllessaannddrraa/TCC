# app/controllers/pacientes_controller.rb
class PacientesController < ApplicationController
  before_action :set_paciente, only: %i[show edit update destroy]
  before_action :authenticate_usuario!
  before_action :authorize_cliente_or_admin, only: %i[new create edit update destroy]

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
      redirect_to @paciente, notice: 'Paciente criado com sucesso.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @paciente.update(paciente_params)
      redirect_to @paciente, notice: 'Paciente atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @paciente.destroy
    redirect_to pacientes_url, notice: 'Paciente deletado com sucesso.'
  end

  private

  def set_paciente
    @paciente = Paciente.find(params[:id])
  end

  def paciente_params
    params.require(:paciente).permit(:nome, :idade, :endereco)
  end

  def authorize_cliente_or_admin
    redirect_to root_path, alert: 'Acesso negado!' unless current_usuario.admin? || current_usuario.cliente?
  end
end
