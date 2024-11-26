
class HomeMatchesController < ApplicationController
  before_action :set_home_match, only: [:show, :edit, :update, :destroy]

  def index
    @home_matches = HomeMatch.all
  end

  def show
  end

  def new
    @home_match = HomeMatch.new
  end

  def create
    @home_match = HomeMatch.new(home_match_params)
    if @home_match.save
      redirect_to home_matches_path, notice: 'Compatibilidade de domicílio criada com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @home_match.update(home_match_params)
      redirect_to home_matches_path, notice: 'Compatibilidade de domicílio atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @home_match.destroy
    redirect_to home_matches_path, notice: 'Compatibilidade de domicílio removida com sucesso.'
  end

  private

  def set_home_match
    @home_match = HomeMatch.find(params[:id])
  end

  def home_match_params
    params.require(:home_match).permit(:nome, :descricao, :criterios)
  end
end
