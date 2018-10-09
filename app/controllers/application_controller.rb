class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      user_path(current_user)
    end

    def after_inactive_sign_up_path_for(resource)
      mail_confirm_path
    end


    protected

    def configure_permitted_parameters
      added_attrs = [:name, :birth_date, :picture, :live]
      added_attrs2 = [:live, :name, :birth_date, :introduction, :picture, :history]
      devise_parameter_sanitizer.permit(:sign_up, keys:  added_attrs)
      devise_parameter_sanitizer.permit(:account_update, keys: added_attrs2)
    end

    def logged_in_user
      unless logged_in?
        store_location
        redirect_to login_url
      end
    end
end
