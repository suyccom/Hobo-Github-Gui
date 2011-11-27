# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

Sgmantenimiento::Application.routes.draw do


  # Lifecycle routes for controller "usuarios"
  put 'usuarios/:id/accept_invitation(.:format)' => 'usuarios#do_accept_invitation', :as => 'do_usuario_accept_invitation'
  get 'usuarios/:id/accept_invitation(.:format)' => 'usuarios#accept_invitation', :as => 'usuario_accept_invitation'
  put 'usuarios/:id/reset_password(.:format)' => 'usuarios#do_reset_password', :as => 'do_usuario_reset_password'
  get 'usuarios/:id/reset_password(.:format)' => 'usuarios#reset_password', :as => 'usuario_reset_password'

  # Resource routes for controller "usuarios"
  get 'usuarios/:id/edit(.:format)' => 'usuarios#edit', :as => 'edit_usuario'
  get 'usuarios/:id(.:format)' => 'usuarios#show', :as => 'usuario', :constraints => { :id => %r([^/.?]+) }
  post 'usuarios(.:format)' => 'usuarios#create', :as => 'create_usuario'
  put 'usuarios/:id(.:format)' => 'usuarios#update', :as => 'update_usuario', :constraints => { :id => %r([^/.?]+) }
  delete 'usuarios/:id(.:format)' => 'usuarios#destroy', :as => 'destroy_usuario', :constraints => { :id => %r([^/.?]+) }

  # Show action routes for controller "usuarios"
  get 'usuarios/:id/account(.:format)' => 'usuarios#account', :as => 'usuario_account'

  # User routes for controller "usuarios"
  match 'usuario_login(.:format)' => 'usuarios#login', :as => 'usuario_login'
  get 'usuario_logout(.:format)' => 'usuarios#logout', :as => 'usuario_logout'
  match 'usuario_forgot_password(.:format)' => 'usuarios#forgot_password', :as => 'usuario_forgot_password'


  # Resource routes for controller "proyectos"
  get 'proyectos(.:format)' => 'proyectos#index', :as => 'proyectos'
  get 'proyectos/new(.:format)', :as => 'new_proyecto'
  get 'proyectos/:id/edit(.:format)' => 'proyectos#edit', :as => 'edit_proyecto'
  get 'proyectos/:id(.:format)' => 'proyectos#show', :as => 'proyecto', :constraints => { :id => %r([^/.?]+) }
  post 'proyectos(.:format)' => 'proyectos#create', :as => 'create_proyecto'
  put 'proyectos/:id(.:format)' => 'proyectos#update', :as => 'update_proyecto', :constraints => { :id => %r([^/.?]+) }
  delete 'proyectos/:id(.:format)' => 'proyectos#destroy', :as => 'destroy_proyecto', :constraints => { :id => %r([^/.?]+) }

  namespace :admin do


    # Lifecycle routes for controller "admin/usuarios"
    post 'usuarios/invite(.:format)' => 'usuarios#do_invite', :as => 'do_usuario_invite'
    get 'usuarios/invite(.:format)' => 'usuarios#invite', :as => 'usuario_invite'

    # Resource routes for controller "admin/usuarios"
    get 'usuarios(.:format)' => 'usuarios#index', :as => 'usuarios'
    get 'usuarios/new(.:format)', :as => 'new_usuario'
    get 'usuarios/:id/edit(.:format)' => 'usuarios#edit', :as => 'edit_usuario'
    get 'usuarios/:id(.:format)' => 'usuarios#show', :as => 'usuario', :constraints => { :id => %r([^/.?]+) }
    post 'usuarios(.:format)' => 'usuarios#create', :as => 'create_usuario'
    put 'usuarios/:id(.:format)' => 'usuarios#update', :as => 'update_usuario', :constraints => { :id => %r([^/.?]+) }
    delete 'usuarios/:id(.:format)' => 'usuarios#destroy', :as => 'destroy_usuario', :constraints => { :id => %r([^/.?]+) }

  end

end
