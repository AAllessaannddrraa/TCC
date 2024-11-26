
class SessoesController < ApplicationController
  before_action :set_sessao, only: [:show, :edit, :update, :destroy]

  def index
    @sessoes = Sessao.all
  end

  def show
  end

  def new
    @sessao = Sessao.new
  end

  def create
    @sessao = Sessao.new(sessao_params)
    if @sessao.save
      redirect_to sessoes_path, notice: 'Sessão criada com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sessao.update(sessao_params)
      redirect_to sessoes_path, notice: 'Sessão atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @sessao.destroy
    redirect_to sessoes_path, notice: 'Sessão removida com sucesso.'
  end

  private

  def set_sessao
    @sessao = Sessao.find(params[:id])
  end

  def sessao_params
    params.require(:sessao).permit(:nome, :descricao, :data, :horario)
  end
end
