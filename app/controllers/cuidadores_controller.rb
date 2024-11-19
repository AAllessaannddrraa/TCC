# app/controllers/cuidadores_controller.rb
class CuidadoresController < ApplicationController
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
      flash[:notice] = 'Cuidador criado com sucesso. Aguarde a validação do administrador.'
      redirect_to cuidadores_path
    else
      flash[:alert] = 'Erro ao criar cuidador.'
      render :new
    end
  end

  def edit
  end

  def update
    if @cuidador.update(cuidador_params)
      flash[:notice] = 'Perfil atualizado com sucesso. Aguardando validação do administrador.'
      redirect_to @cuidador
    else
      flash[:alert] = 'Erro ao atualizar o perfil.'
      render :edit
    end
  end

  def destroy
    @cuidador.destroy
    flash[:notice] = 'Cuidador removido com sucesso.'
    redirect_to cuidadores_path
  end

  private

  def find_cuidador
    @cuidador = Cuidador.find(params[:id])
  end

  def cuidador_params
    params.require(:cuidador).permit(:nome, :numero_contato, :email, :endereco, :outros_atributos)
  end
end
