class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      root_path
    when User
      user_path(current_user.id)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :nickname])
  end
end
