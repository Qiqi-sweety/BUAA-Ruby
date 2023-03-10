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
      stored_location_for(resource) || buyers_path
    elsif current_user.role ==1
      stored_location_for(resource) || sellers_path
    elsif current_user.role ==2
      stored_location_for(resource) || riders_path
    end
  end

end
