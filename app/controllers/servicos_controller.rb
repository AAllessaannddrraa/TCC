class ServicosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_servico, only: %i[show edit update destroy aprovar reprovar ativar desativar pausar]

  def index
    @servicos = Servico.includes(:tipo_servico, :cliente, :cuidador).order(created_at: :desc)
  end

  def show; end

  def new
    @servico = Servico.new
  end

  def create
    @servico = Servico.new(servico_params)
    if @servico.save
      redirect_to servicos_path, notice: 'Serviço cadastrado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @servico.update(servico_params)
      redirect_to servicos_path, notice: 'Serviço atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @servico.destroy
    redirect_to servicos_path, notice: 'Serviço removido com sucesso.'
  end

  # Métodos de status
  def aprovar
    @servico.aprovado!
    redirect_to servicos_path, notice: 'Serviço aprovado.'
  end

  def reprovar
    @servico.reprovado!
    redirect_to servicos_path, notice: 'Serviço reprovado.'
  end

  def ativar
    @servico.ativo!
    redirect_to servicos_path, notice: 'Serviço ativado.'
  end

  def desativar
    @servico.inativo!
    redirect_to servicos_path, notice: 'Serviço desativado.'
  end

  def pausar
    @servico.pausado!
    redirect_to servicos_path, notice: 'Serviço pausado.'
  end

  private

  def set_servico
    @servico = Servico.find(params[:id])
  end

  def servico_params
    params.require(:servico).permit(:nome, :descricao, :preco, :status, :tipo_servico_id, :cliente_id, :cuidador_id, :data_agendamento)
  end

  def ensure_admin
    redirect_to root_path, alert: "Acesso negado! Apenas administradores podem acessar esta área." unless current_usuario&.admin?
  end
end
