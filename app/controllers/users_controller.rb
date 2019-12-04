class UsersController < ApplicationController

    def show
        if session[:user_id]
            @user = User.find_by(id: params[:id])
            @photoshoots = @user.photoshoots.all
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
        params.require(:user).permit(:username, :password, :email)
    end
end
