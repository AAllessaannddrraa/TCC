# app/controllers/servicos_controller.rb
class ServicosController < ApplicationController
  before_action :encontrar_servico, only: [:mostrar, :editar, :atualizar, :destruir, :confirmar, :rejeitar]
  before_action :exigir_login
  before_action :verificar_acesso, only: [:editar, :atualizar, :destruir]

  def index
    @servicos = current_usuario.role == 'administrador' ? Servico.all : current_usuario.servicos
  end

  def mostrar
  end

  def novo
    @servico = Servico.new
  end

  def criar
    @servico = Servico.new(servico_params)
    @servico.usuario = current_usuario # Associando ao usuário logado

    if @servico.save
      flash[:notice] = 'Serviço agendado com sucesso. Aguardando confirmação.'
      redirect_to servicos_path
    else
      flash[:alert] = 'Erro ao agendar o serviço.'
      render :novo
    end
  end

  def editar
  end

  def atualizar
    if @servico.update(servico_params)
      flash[:notice] = 'Serviço atualizado com sucesso.'
      redirect_to @servico
    else
      flash[:alert] = 'Erro ao atualizar o serviço.'
      render :editar
    end
  end

  def destruir
    @servico.destroy
    flash[:notice] = 'Serviço removido com sucesso.'
    redirect_to servicos_path
  end

  def confirmar
    if current_usuario.role == 'cuidador' && @servico.update(status: :confirmado)
      flash[:notice] = 'Serviço confirmado com sucesso.'
    else
      flash[:alert] = 'Erro ao confirmar o serviço.'
    end
    redirect_to servicos_path
  end

  def rejeitar
    if current_usuario.role == 'cuidador' && @servico.update(status: :rejeitado)
      flash[:notice] = 'Serviço rejeitado com sucesso.'
    else
      flash[:alert] = 'Erro ao rejeitar o serviço.'
    end
    redirect_to servicos_path
  end

  private

  def encontrar_servico
    @servico = Servico.find(params[:id])
  end

  def servico_params
    params.require(:servico).permit(:descricao, :data_hora, :cuidador_id)
  end

  def verificar_acesso
    unless current_usuario.role == 'administrador' || @servico.usuario == current_usuario
      flash[:alert] = 'Você não tem permissão para realizar esta ação.'
      redirect_to servicos_path
    end
  end
end
