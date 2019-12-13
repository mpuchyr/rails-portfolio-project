class UsersController < ApplicationController
    before_action :logged_in?, except: [:new, :create]

    def show   
        @user = current_user
        if session[:user_id] == @user.id
            @photoshoots = @user.photoshoots.all
            @location_filter = location_filter
            @date_filter = date_filter
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

    def location_filter
        if !params[:location].blank?
            @photoshoots = @photoshoots.where(location_id: params[:location])
        end
    end

    def date_filter
        if params[:date]
            if !params[:date][:year].blank? && !params[:date][:month].blank? && !params[:date][:day].blank?
                year = params[:date][:year]
                month = params[:date][:month]
                day = params[:date][:day]
                if month.to_i < 10
                    month = "0" + month.to_s
                end
                if day.to_i < 10
                    day = "0" + day.to_s
                end
                date = "%" + year.to_s + "-" + month.to_s + "-" + day.to_s + "%"
                @photoshoots = @photoshoots.where('start_time LIKE ?', date)
            elsif !params[:date][:year].blank? && !params[:date][:month].blank? && params[:date][:day].blank?
                year = params[:date][:year]
                month = params[:date][:month]
                if month.to_i < 10
                    month = "0" + month.to_s
                end
                date = "%" + year.to_s + "-" + month.to_s + "-%"
                @photoshoots = @photoshoots.where('start_time LIKE ?', date)
            elsif !params[:date][:year].blank? && params[:date][:month].blank? && params[:date][:day].blank?
                year = params[:date][:year]
                date = "%" + year.to_s + "%"
                @photoshoots = @photoshoots.where('start_time LIKE ?', date)
            elsif params[:date][:year].blank? && !params[:date][:month].blank? && params[:date][:day].blank?
                month = params[:date][:month]
                if month.to_i < 10
                    month = "0" + month.to_s
                end
                date = "%-" + month + "-%"
                @photoshoots = @photoshoots.where('start_time LIKE ?', date)
            end
        end
    end
end
