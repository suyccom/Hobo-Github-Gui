module ProyectosHelper

  def nombre_tecnico(nick)
    case nick
    when 'txapelgorri'
      'Ibon Castilla'
    when 'suyccom'
      'Tecnicos UnoyCero'
    when 'Piterpla'
      'Pedro'
    when 'Josu'
      'Josu'
    else
      nick
    end
  end

end
