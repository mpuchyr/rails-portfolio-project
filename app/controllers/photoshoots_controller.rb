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
end
