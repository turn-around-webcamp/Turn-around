class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
      user_path(current_user)
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_japanese, :first_name_japanese, :last_name_katakana, :first_name_katakana, :postal_code, :address, :tel])
  end
end
