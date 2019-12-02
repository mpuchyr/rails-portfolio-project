class SessionsController < ApplicationController

    def create
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
