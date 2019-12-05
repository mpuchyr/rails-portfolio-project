class UsersController < ApplicationController
    before_action :set_time_zone
    
    def show
        if session[:user_id]
            @user = current_user
            if session[:user_id] == @user.id
                @photoshoots = @user.photoshoots.all
            else
                redirect_to user_path(session[:user_id])
            end
        else
            redirect_to root_path
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :email, :time_zone)
    end
end
