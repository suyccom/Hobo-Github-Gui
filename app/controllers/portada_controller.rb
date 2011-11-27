class PortadaController < ApplicationController

  hobo_controller

  def index; end

  def summary
    if !current_user.administrator?
      redirect_to user_login_path
    end
  end

  def search
    if params[:query]
      site_search(params[:query])
    end
  end

  def exportar_tracks
    unless params[:check] == 'Oom7airiCea4aethKaela4faohl3iuQu'
      redirect_to '/'
    end
    @proyectos = Proyecto.all
  end

end
