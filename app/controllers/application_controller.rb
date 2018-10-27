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


    def after_edit_user_password_path(resource)
      new_user_session_path
    end


    protected

    def configure_permitted_parameters
      added_attrs2 = [:live, :name, :birth_date, :introduction, :picture, :history, :gender]
      devise_parameter_sanitizer.permit(:account_update, keys: added_attrs2)
    end



end
