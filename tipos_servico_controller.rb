class TiposServicoController < ApplicationController
  before_action :set_tipo_servico, only: %i[show edit update destroy]

  def index
    @tipos_servico = TipoServico.ordenados
  end

  def show; end

  def new
    @tipo_servico = TipoServico.new
  end

  def create
    @tipo_servico = TipoServico.new(tipo_servico_params)
    if @tipo_servico.save
      redirect_to tipos_servico_path, notice: 'Tipo de serviço criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @tipo_servico.update(tipo_servico_params)
      redirect_to tipos_servico_path, notice: 'Tipo de serviço atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tipo_servico.destroy
    redirect_to tipos_servico_path, notice: 'Tipo de serviço removido.'
  end

  private

  def set_tipo_servico
    @tipo_servico = TipoServico.find(params[:id])
  end

  def tipo_servico_params
    params.require(:tipo_servico).permit(:nome, :descricao)
  end
end
