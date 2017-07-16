class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:about, :showProfile, :indexProfile]
  before_filter :configure_permitted_parameters, if: :devise_controller?
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :current_password, :avatar])
    end

end

module ApplicationHelper
  def title(text)
    content_for :title, text
  end
  def body_class(class_name="default_class")
    content_for :body_class, class_name
  end

end
