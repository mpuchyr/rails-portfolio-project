class SessionsController < ApplicationController

    def new
    end

    def create

        if auth
            @user = User.find_by(email: auth['info']['email'])
            if @user
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                @user = User.create do |u|
                    u.username = auth['info']['email'].split('@').first
                    u.email = auth['info']['email']
                    u.password = SecureRandom.hex
                end
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            end
        else
            @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id]
                redirect_to user_path(@user)
            else
                flash[:alert] = "Username or password was incorrect"
                redirect_to login_path
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end
