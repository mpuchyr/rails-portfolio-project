class LocationsController < ApplicationController

    def new
        @location = Location.new
        @location.photoshoots.build
    end

    def create
        binding.pry
        if location_params[:name].blank?
            @location = Location.find_by(id: location_params[:id])
        else
            @location = Location.find_or_create_by(name: location_params[:name])
        end
        @photoshoot = @location.photoshoots.create(location_params[:photoshoots_attributes]["0"])
        redirect_to photoshoot_path(@photoshoot)
    end

    private
    def location_params
        params.require(:location).permit(:name, :id, photoshoots_attributes: [:start_time, :end_time, :comments, :user_id])
    end
end
