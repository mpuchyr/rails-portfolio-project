class LocationsController < ApplicationController

    def new
        if session[:user_id]
            @location = Location.new
            @location.photoshoots.build
        else
            redirect_to root_path
        end
    end

    def create
        if location_params[:name].blank? && !location_params[:id].blank?
            @location = Location.find_by(id: location_params[:id])
            @photoshoot = @location.photoshoots.create(location_params[:photoshoots_attributes]["0"])
            redirect_to photoshoot_path(@photoshoot)
        elsif location_params[:id].blank? && !location_params[:name].blank?
            @location = Location.find_or_create_by(name: location_params[:name])
            @photoshoot = @location.photoshoots.create(location_params[:photoshoots_attributes]["0"])
            redirect_to photoshoot_path(@photoshoot)
        else
            redirect_to new_location_path
        end
    end


    private
    def location_params
        params.require(:location).permit(:name, :id, photoshoots_attributes: [:start_time, :end_time, :comments, :user_id])
    end
end
