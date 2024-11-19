# spec/controllers/usuarios_controller_spec.rb
require 'rails_helper'

RSpec.describe UsuariosController, type: :controller do
  let(:usuario) { Usuario.create(nome: 'Usuario Teste', email: 'usuario@teste.com', password: 'senha123') }

  describe 'GET #editar' do
    before { session[:usuario_id] = usuario.id }

    it 'retorna sucesso para a edição de perfil' do
      get :editar, params: { id: usuario.id }
      expect(response).to be_successful
    end
  end

  describe 'PATCH #atualizar' do
    before { session[:usuario_id] = usuario.id }

    it 'atualiza o perfil com dados válidos' do
      patch :atualizar, params: { id: usuario.id, usuario: { nome: 'Nome Atualizado' } }
      usuario.reload
      expect(usuario.nome).to eq('Nome Atualizado')
      expect(response).to redirect_to(usuario)
      expect(flash[:notice]).to eq('Perfil atualizado com sucesso.')
    end

    it 'não atualiza com dados inválidos' do
      patch :atualizar, params: { id: usuario.id, usuario: { nome: '' } }
      expect(response).to render_template(:editar)
      expect(flash[:alert]).to eq('Erro ao atualizar o perfil.')
    end
  end
end
