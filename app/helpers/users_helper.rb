module UsersHelper

    def age
     @user = User.find_by(name: params[:name])
  date_format = "%Y%m%d"
  (Date.today.strftime(date_format).to_i - @user.birth_date.strftime(date_format).to_i) / 10000
end
end
