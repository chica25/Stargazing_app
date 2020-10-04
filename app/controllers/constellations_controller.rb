class ConstellationsController < ApplicationController

    def index
        @constellations = Constellation.all
    end

    def show
        @constellation = Constellation.find(params[:id])
    end

    def new
        @constellation = Constellation.new
    end

    def create
        @constellation = Constellation.new(const_params)
        if @constellation.save
            redirect_to  constellation_path(@constellation)
        else
         render :new
        end
    end

    private

    def const_params
        params.require(:constellation).permit(:name, :description, :light_years_away_from_earth, :url_image)
    end
end
