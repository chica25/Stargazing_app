class ConstellationsController < ApplicationController
    before_action :set_const, only: [ :show]

    def index
        @constellations = Constellation.all
    end

    def show
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

    def set_const
        @constellation = Constellation.find(params[:id])
    end
end
