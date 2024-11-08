class CuidadoresController < ApplicationController
  before_action :set_cuidador, only: %i[show edit update destroy]

  def index
    @cuidadores = Cuidador.all
  end

  def show
  end

  def new
    @cuidador = Cuidador.new
  end

  def create
    @cuidador = Cuidador.new(cuidador_params)
    if @cuidador.save
      redirect_to @cuidador, notice: 'Cuidador criado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cuidador.update(cuidador_params)
      redirect_to @cuidador, notice: 'Cuidador atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @cuidador.destroy
    redirect_to cuidadores_url, notice: 'Cuidador excluído com sucesso.'
  end

  private

  def set_cuidador
    @cuidador = Cuidador.find(params[:id])
  end

  def cuidador_params
    params.require(:cuidador).permit(:nome, :idade, :numero_contato, :email, :qualificacoes, :certificacoes, :historico_trabalho, :avaliacoes, :disponibilidade)
  end
end
