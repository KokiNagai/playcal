class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    before_action :configure_permitted_parameters, if: :devise_controller?


    protected

    def configure_permitted_parameters
      added_attrs = [:name, :birth_date]
      devise_parameter_sanitizer.permit(:sign_up, keys:  added_attrs)
    end

    def logged_in_user
      unless logged_in?
        store_location
        redirect_to login_url
      end
    end
end
