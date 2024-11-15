# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include SessoesHelper # Inclua o módulo corretamente se necessário
end
