class PagesController < ApplicationController
  skip_before_action :authenticate_usuario!, only: :home
  
  def home
  end
end
