class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[show edit update destroy]
  before_action :authenticate_usuario!
  before_action :authorize_admin_or_rh, only: %i[new create edit update destroy]

  def index
    @clientes = Cliente.all
  end

  def show; end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      redirect_to @cliente, notice: 'Cliente cadastrado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @cliente.update(cliente_params)
      redirect_to @cliente, notice: 'Cliente atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cliente.update(status: :inativo)
    redirect_to clientes_url, notice: 'Cliente removido com sucesso.'
  end

  private

  def set_cliente
    @cliente = Cliente.find(params[:id])
  end

  def cliente_params
    params.require(:cliente).permit(:nome, :email, :numero_contato, :status, :responsavel_id)
  end

  def authorize_admin_or_rh
    redirect_to root_path, alert: 'Acesso negado!' unless current_usuario.admin? || current_usuario.rh?
  end
end
