class ServicosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_servico, only: %i[show edit update destroy]

  def index
    @servicos = Servico.all
  end

  def show; end

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

  def edit; end

  def update
    if @servico.update(servico_params)
      redirect_to @servico, notice: 'Serviço atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @servico.destroy
    redirect_to servicos_url, notice: 'Serviço deletado com sucesso.'
  end

  private

  def set_servico
    @servico = Servico.find(params[:id])
  end

  def servico_params
    params.require(:servico).permit(:nome, :descricao, :preco)
  end

  def ensure_admin
    redirect_to root_path, alert: "Acesso negado! Apenas administradores podem acessar esta área." unless current_usuario&.admin?
  end
end
