class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when User
      root_path
    when Admin
      admin_root_path
    end
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_japanese, :first_name_japanese, :last_name_katakana, :first_name_katakana, :postal_code, :address, :tel])
  end
end
