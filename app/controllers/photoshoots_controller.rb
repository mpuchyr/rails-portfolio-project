class PhotoshootsController < ApplicationController

    def show
        @photoshoot = Photoshoot.find_by(id: params[:id])
    end
end
