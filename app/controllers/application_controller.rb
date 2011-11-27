class ApplicationController < ActionController::Base
  protect_from_forgery
  include Hobo::Controller::AuthenticationSupport
  before_filter :except => [:login, :forgot_password, :accept_invitation, :do_accept_invitation, :reset_password,
:do_reset_password, :exportar_tracks] do
     login_required unless Usuario.count == 0
  end
end
