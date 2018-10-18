class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    before_action :configure_permitted_parameters, if: :devise_controller?

    before_action :ensure_domain
    FQDN = 'www.playcal.jp'

  # redirect correct server from herokuapp domain for SEO
  def ensure_domain
   return unless /\.herokuapp.com/ =~ request.host

   # 主にlocalテスト用の対策80と443以外でアクセスされた場合ポート番号をURLに含める
   port = ":#{request.port}" unless [80, 443, 3000].include?(request.port)
   redirect_to "#{request.protocol}#{FQDN}#{port}#{request.path}", status: :moved_permanently
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

    def after_update_path_for(resource)
      user_path(current_user)
    end



    protected

    def configure_permitted_parameters
      added_attrs = [:name, :birth_date, :picture, :live, :gender]
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
