class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me,:role,buyer_attributes:[:telephone,:address],seller_attributes:[:address,:image],rider_attributes:[:telephone,:address]]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    if current_user.role ==0
      stored_location_for(resource) || buyer_path(2)
    elsif current_user.role ==1
      stored_location_for(resource) || seller_path(2)
    elsif current_user.role ==2
      stored_location_for(resource) || rider_path(2)
    end
  end

end
