class PhotoshootsController < ApplicationController

    def show
        if session[:user_id]
            @photoshoot = Photoshoot.find_by(id: params[:id])
            if !@photoshoot || @photoshoot.user.id != session[:user_id]
                redirect_to user_path(session[:user_id])
            end
        else
            redirect_to login_path
        end
    end

    def edit
        @photoshoot = Photoshoot.find_by(id: params[:id])

    end

    def update
        @photoshoot = Photoshoot.find_by(id: params[:id])
        @location = @photoshoot.location
        if @photoshoot.update(photoshoot_params.except(:location_attributes))
            # @photoshoot.location = Location.find_by(photoshoot_params[])
            binding.pry
            if !photoshoot_params[:location_attributes][:name].blank?
                @photoshoot.location = Location.find_or_create_by(name: photoshoot_params[:location_attributes][:name])
                @photoshoot.save
            else
                @photoshoot.location = Location.find_by(id: photoshoot_params[:location_attributes][:id])
                @photoshoot.save
            end
            redirect_to photoshoot_path(@photoshoot)
        else
            render :edit
        end
    end


    def destroy
        Photoshoot.find(params[:id]).destroy
        redirect_to user_path(session[:user_id])
    end

    private
    def photoshoot_params
        params.require(:photoshoot).permit(:start_time, :end_time, :comments, location_attributes: [:name, :id])
    end
end
