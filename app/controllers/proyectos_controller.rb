class ProyectosController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  require 'net/http'
  
  class Patch < Net::HTTPRequest
    METHOD = "PATCH"
    REQUEST_HAS_BODY = true
    RESPONSE_HAS_BODY = true
  end
  
  def nueva_tarea
 
    # Ejemplo de petición con CURL 
    # curl -u "suyccom:aiTh2iso" -X POST -d '{"title":"Testing Github API","body":"This is an issue!"}' https://api.github.com/repos/suyccom/Rails-Hobo-Client-Manager/issues
    
    # Cargar el proyecto
    proyecto = Proyecto.find(params[:id])
    url = '/repos/' + proyecto.usuario_github + '/' + proyecto.repositorio_github + '/issues'

    # Crear la petición con el JSON
    @payload ={
        "title" => params[:title],
        "body" => 'Tarea creada por ' + current_user.name + ': ' + params[:body]
      }.to_json
    peticion = Net::HTTP::Post.new(url)
    peticion.basic_auth proyecto.usuario_github,proyecto.pass_github
    peticion.body = @payload
    
    # Enviar la petición a Github por HTTPS
    conexion = Net::HTTP.new('api.github.com',443)
    conexion.use_ssl = true
    conexion.verify_mode = OpenSSL::SSL::VERIFY_NONE #FIXME: Mejorar la seguridad SSL
    conexion.start {|http| http.request(peticion) }
 
 
    flash[:notice] = "Se ha creado una nueva tarea correctamente"
    redirect_to "/proyectos/#{params[:id]}"
  end
  
  
  def borrar_tarea
    
    
    # curl -u "suyccom:aiTh2iso" -X PATCH -d '{"state":"closed"}' https://api.github.com/repos/suyccom/prueba-tareas/issues/2183658
  
    # Cargar el proyecto
    proyecto = Proyecto.find(params[:id])
    url = '/repos/' + proyecto.usuario_github + '/' + proyecto.repositorio_github + '/issues/' + params[:tarea]

    # Crear la petición con el JSON
    @payload ={
        "state" => "closed"
      }.to_json
    peticion = Patch.new(url)
    peticion.basic_auth proyecto.usuario_github,proyecto.pass_github
    peticion.body = @payload
    
    # Enviar la petición a Github por HTTPS
    conexion = Net::HTTP.new('api.github.com',443)
    conexion.use_ssl = true
    conexion.verify_mode = OpenSSL::SSL::VERIFY_NONE #FIXME: Mejorar la seguridad SSL
    conexion.start {|http| http.request(peticion) }
 
 
    flash[:notice] = "Se ha cerrado la tarea correctamente"
    redirect_to "/proyectos/#{params[:id]}"
  end
  
  
  def editar_tarea
    @proyecto = Proyecto.find(params[:id])
    url = 'https://api.github.com/repos/' + @proyecto.usuario_github + '/' + @proyecto.repositorio_github + '/issues/' + params[:tarea]    
    
    uri = URI.parse(url)
    peticion = Net::HTTP::Get.new(uri.request_uri)
    peticion.basic_auth @proyecto.usuario_github,@proyecto.pass_github
    
    conexion = Net::HTTP.new(uri.host, uri.port)
    conexion.use_ssl = true
    conexion.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    response = conexion.request(peticion)
    
    @tarea = ActiveSupport::JSON.decode(response.body)
  end
  
  
  def guardar_tarea
    # Cargar el proyecto
    proyecto = Proyecto.find(params[:id])
    url = '/repos/' + proyecto.usuario_github + '/' + proyecto.repositorio_github + '/issues/' + params[:tarea]

    # Crear la petición con el JSON
    @payload ={
        "title" => params[:title],
        "body" => params[:body]
      }.to_json
    peticion = Patch.new(url)
    peticion.basic_auth proyecto.usuario_github,proyecto.pass_github
    peticion.body = @payload
    
    # Enviar la petición a Github por HTTPS
    conexion = Net::HTTP.new('api.github.com',443)
    conexion.use_ssl = true
    conexion.verify_mode = OpenSSL::SSL::VERIFY_NONE #FIXME: Mejorar la seguridad SSL
    conexion.start {|http| http.request(peticion) }
 
    flash[:notice] = "Se ha modificado la tarea ##{params['tarea']} correctamente"
    redirect_to "/proyectos/#{params[:id]}"
  end


  def show
  
    proyecto = Proyecto.find(params[:id])
    url = 'https://api.github.com/repos/' + proyecto.usuario_github + '/' + proyecto.repositorio_github + '/issues'    
    if params[:completadas]
      url += '?state=closed'
    end
    
    uri = URI.parse(url)
    peticion = Net::HTTP::Get.new(uri.request_uri)
    peticion.basic_auth proyecto.usuario_github,proyecto.pass_github

    
    conexion = Net::HTTP.new(uri.host, uri.port)
    conexion.use_ssl = true
    conexion.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    response = conexion.request(peticion)
    
    
    # logger.info "Response #{response.code} #{response.message}: #{response.body}"
    @tareas = ActiveSupport::JSON.decode(response.body)
    

      
    hobo_show
  end

end
