class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.  

  include Pundit
  protect_from_forgery
  before_action :authenticate_persona!
  
  #after_action :verify_policy_scoped, only: :index

  helper_method :resource_name, :resource, :devise_mapping
  alias_method :current_user, :current_persona
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	  def resource_name
	    :persona
	  end
	 
	  def resource
	    @resource ||= Persona.new
	  end
	 
	  def devise_mapping
	    @devise_mapping ||= Devise.mappings[:persona]
	  end


  private
  def user_not_authorized
    flash[:alert] = "Usted no tiene los permisos para acceder a esta dirección"
    redirect_to(request.referrer || admin_index_path)
  end

  def pundit_user
    current_persona
  end

end
