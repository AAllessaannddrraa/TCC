# app/models/usuario.rb
class Usuario < ApplicationRecord
  has_secure_password
  before_create :generate_otp_secret

  # Gera uma chave secreta para 2FA
  def generate_otp_secret
    self.otp_secret ||= ROTP::Base32.random_base32
  end

  # Gera um código OTP baseado na chave secreta
  def current_otp
    totp = ROTP::TOTP.new(self.otp_secret)
    totp.now
  end

  # Verifica o código OTP fornecido
  def validate_otp(otp_code)
    totp = ROTP::TOTP.new(self.otp_secret)
    totp.verify(otp_code)
  end
end
