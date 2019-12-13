class ApplicationController < ActionController::Base
    private
    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        if !current_user
            redirect_to login_path
        end
    end

end
