class ApplicationController < ActionController::Base
    private
    def current_user
        User.find_by(id: session[:user_id])
    end

    def set_time_zone
        if current_user
            current_user.time_zone
        end
    end
end
