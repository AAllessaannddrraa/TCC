class CuidadoresController < ApplicationController
  before_action :set_cuidador, only: %i[show edit update destroy]
  before_action :require_login # Certifique-se de que este método está definido na aplicação ou em um módulo helper

  def index
    @cuidadores = Cuidador.all
  end

  def show; end

  def new
    @cuidador = Cuidador.new
  end

  def create
    @cuidador = Cuidador.new(cuidador_params)
    if @cuidador.save
      redirect_to @cuidador, notice: 'Cuidador criado com sucesso.'
    else
      render :new, alert: 'Erro ao criar cuidador. Verifique os campos.'
    end
  end

  def edit; end

  def update
    if @cuidador.update(cuidador_params)
      redirect_to @cuidador, notice: 'Cuidador atualizado com sucesso.'
    else
      render :edit, alert: 'Erro ao atualizar cuidador.'
    end
  end

  def destroy
    @cuidador.destroy
    redirect_to cuidadores_url, notice: 'Cuidador excluído com sucesso.'
  end

  private

  def set_cuidador
    @cuidador = Cuidador.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to cuidadores_path, alert: 'Cuidador não encontrado.'
  end

  def cuidador_params
    params.require(:cuidador).permit(:nome, :numero_contato)
  end
end
