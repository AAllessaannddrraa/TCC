module SessoesHelper
  # Faz login do usuário dado
  def log_in(user)
    session[:user_id] = user.id
  end

  # Retorna o usuário atual logado (se houver)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Retorna verdadeiro se o usuário estiver logado, caso contrário falso
  def logged_in?
    !current_user.nil?
  end

  # Faz logout do usuário atual
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
