class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :special_controller_action?
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def special_controller_action?
    (controller_name == 'homes'         && action_name == 'top')  ||
    (controller_name == 'homes'         && action_name == 'about')||
    (controller_name == 'sessions'      && action_name == 'new')  ||
    (controller_name == 'registrations' && action_name == 'new')

  end

  def authenticate_user!
    redirect_to root_path unless user_signed_in?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) if resource_class == User
  end
end
