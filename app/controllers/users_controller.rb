class UsersController < ApplicationController
    before_action :logged_in?, except: [:new, :create]

    def show   
        @user = current_user
        if session[:user_id] == @user.id
            @photoshoots = @user.photoshoots.all
        else
            redirect_to user_path(session[:user_id])
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

    def edit
        if session[:user_id] == current_user.id
            @user = current_user
        else
            render user_path(current_user)
        end

    end

    def update
        @user = current_user
        @user.update(user_params)
        redirect_to user_path(current_user)

    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :email, :time_zone)
    end

end
