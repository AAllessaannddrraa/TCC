# app/mailers/usuario_mailer.rb
class UsuarioMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def welcome_email(usuario)
    @usuario = usuario
    @url = login_url
    mail(to: @usuario.email, subject: 'Bem-vindo ao nosso sistema!')
  end

  def otp_email(usuario, otp_code)
    @usuario = usuario
    @otp_code = otp_code
    mail(to: @usuario.email, subject: 'Seu Código de Verificação')
  end
end
