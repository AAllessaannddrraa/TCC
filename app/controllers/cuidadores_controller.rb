# app/controllers/cuidadores_controller.rb
class CuidadoresController < ApplicationController
  before_action :authenticate_usuario!
  before_action :ensure_rh
  before_action :find_cuidador, only: [:show, :edit, :update, :destroy]

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
      flash[:notice] = 'Cuidador cadastrado com sucesso.'
      redirect_to cuidadores_path
    else
      flash[:alert] = 'Erro ao cadastrar cuidador.'
      render :new
    end
  end

  def edit
    @cuidador = Cuidador.find(params[:id])
  end

  def update
    @cuidador = Cuidador.find(params[:id])
    if @cuidador.update(cuidador_params)
      flash[:notice] = 'Perfil atualizado com sucesso.'
      redirect_to cuidadores_path
    else
      flash[:alert] = 'Erro ao atualizar o perfil.'
      render :edit
    end
  end

  def destroy
    @cuidador = Cuidador.find(params[:id])
    @cuidador.destroy
    flash[:notice] = 'Cuidador removido com sucesso.'
    redirect_to cuidadores_path
  end

  private

  def ensure_rh
    redirect_to root_path, alert: "Acesso negado!" unless current_usuario&.rh?
  end

  def find_cuidador
    @cuidador = Cuidador.find(params[:id])
  end

  def cuidador_params
    params.require(:cuidador).permit(:nome, :numero_contato, :email, :endereco, :habilidades, :disponibilidade)
  end
end

module Rh
  class CuidadoresController < ApplicationController
    before_action :ensure_rh

    def index
      @cuidadores = Cuidador.where(status: 'cadastrado')
    end

    def update
      @cuidador = Cuidador.find(params[:id])
      if params[:status].present?
        @cuidador.update(status: params[:status])
        redirect_to rh_cuidadores_path, notice: "Cuidador atualizado com sucesso."
      else
        redirect_to rh_cuidadores_path, alert: "Status inválido."
      end
    end

    private

    def ensure_rh
      redirect_to root_path unless current_usuario.rh?
    end
  end
end
