# app/controllers/sessoes_controller.rb
class SessoesController < ApplicationController
  def criar
    usuario = Usuario.find_by(email: params[:email])
    if usuario&.authenticate(params[:password])
      session[:usuario_id] = usuario.id
      # Envia o email com o código de verificação 2FA
      UsuarioMailer.otp_email(usuario, usuario.current_otp).deliver_now
      redirect_to verificar_2fa_path # Redireciona para a página de verificação de 2FA
    else
      flash[:alert] = 'Email ou senha inválidos.'
      render :novo
    end
  end

  def verificar_2fa
    @usuario = Usuario.find(session[:usuario_id])
  end

  def confirmar_2fa
    @usuario = Usuario.find(session[:usuario_id])
    if @usuario.validate_otp(params[:otp_code])
      flash[:notice] = 'Login realizado com sucesso.'
      redirect_to root_path
    else
      flash[:alert] = 'Código de verificação inválido.'
      render :verificar_2fa
    end
  end
end
