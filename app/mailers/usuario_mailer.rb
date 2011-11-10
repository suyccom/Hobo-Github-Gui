class UsuarioMailer < ActionMailer::Base
  default :from => "noreply@e-cotec21.org"

  def forgot_password(usuario, key)
    @usuario, @key = usuario, key
    mail( :subject => "#{app_name} -- contrasena olvidada",
          :to      => usuario.email_address )
  end

  def invite(usuario, key)
    @usuario, @key = usuario, key
    mail( :subject => "Invitacion a #{app_name}",
          :to      => usuario.email_address )
  end

end
