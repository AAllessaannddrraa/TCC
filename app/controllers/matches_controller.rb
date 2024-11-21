
class MatchesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :ensure_admin

  # List all potential matches (admin view)
  def index
    @clientes = Usuario.where(role: "cliente")
    @cuidadores = Usuario.where(role: "cuidador")
    @matches = []

    # Generate potential matches based on logic
    @clientes.each do |cliente|
      @cuidadores.each do |cuidador|
        if cuidador.match_with_cliente(cliente)
          @matches << { cliente: cliente, cuidador: cuidador }
        end
      end
    end
  end

  # Assign a caregiver to a client
  def create
    cliente = Usuario.find(params[:cliente_id])
    cuidador = Usuario.find(params[:cuidador_id])

    if cliente.update(cuidador_id: cuidador.id)
      cliente.notify("Você foi combinado com o cuidador #{cuidador.nome}.")
      cuidador.notify("Você foi combinado com o cliente #{cliente.nome}.")
      flash[:notice] = "Cuidador atribuído ao cliente com sucesso."
    else
      flash[:alert] = "Erro ao atribuir cuidador."
    end

    redirect_to matches_path
  end

  private

  def ensure_admin
    redirect_to root_path, alert: "Acesso negado!" unless current_usuario.admin?
  end
end
