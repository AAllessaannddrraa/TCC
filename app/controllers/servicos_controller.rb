
class ServicosController < ApplicationController
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
  before_action :authenticate_usuario!

  def index
    @servicos = Servico.all
  end

  def show
    @servico = Servico.find(params[:id])
  end

  def new
    @servico = Servico.new
  end

  def create
    @servico = Servico.new(servico_params)
    @servico.cliente = current_usuario

    if @servico.save
      redirect_to servicos_path, notice: 'Serviço agendado com sucesso.'
    else
      render :new
    end
  end

  def confirmar
    @servico = Servico.find(params[:id])
    if @servico.update(status: 'confirmado')
      redirect_to servicos_path, notice: 'Serviço confirmado com sucesso.'
    else
      redirect_to servicos_path, alert: 'Erro ao confirmar serviço.'
    end
  end

  private

  def servico_params
    params.require(:servico).permit(:nome, :descricao, :preco, :data_agendamento)
  end
end
