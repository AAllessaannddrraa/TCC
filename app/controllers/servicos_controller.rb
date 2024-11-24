class ServicosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :ensure_admin, only: [:new, :create, :edit, :update, :destroy, :confirmar]
  before_action :set_servico, only: [:show, :edit, :update, :destroy, :confirmar]

  def calendar_events
    servicos = Servico.all
    events = servicos.map do |servico|
      {
        title: servico.nome,
        start: servico.data_agendamento.strftime('%Y-%m-%dT%H:%M:%S'),
        id: servico.id
      }
    end
    render json: events
  end

  def index
    @servicos = Servico.all
  end

  def show
  end

  def new
    @servico = Servico.new
  end

  def create
    @servico = Servico.new(servico_params)
    if @servico.save
      redirect_to @servico, notice: 'Serviço criado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @servico.update(servico_params)
      redirect_to @servico, notice: 'Serviço atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @servico.destroy
    redirect_to servicos_url, notice: 'Serviço excluído com sucesso.'
  end

  def confirmar
    if @servico.update(status: 'confirmado')
      redirect_to servicos_path, notice: 'Serviço confirmado com sucesso.'
    else
      redirect_to servicos_path, alert: 'Erro ao confirmar serviço.'
    end
  end

  private

  def set_servico
    @servico = Servico.find(params[:id])
  end

  def servico_params
    params.require(:servico).permit(:nome, :descricao, :preco, :data_agendamento, :cuidador_id)
  end

  def ensure_admin
    redirect_to root_path, alert: "Acesso negado! Apenas administradores podem acessar esta área." unless current_usuario&.admin?
  end
end
