module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def other_user
      @other_user ||= User.where.not(id: current_user.id)
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

end
