class ConstellationsController < ApplicationController
    before_action :set_cons, only: [:show]

    def index
        @constellations = Constellation.all.sorted    
    end

    def far_away
        @constellations = Constellation.where("light_years_away_from_earth > 250")
    end

    def close
        @constellations = Constellation.close
    end

    def show
    end

    def new
        @constellation = Constellation.new
    end
    
    def create
       @constellation = Constellation.new(cons_params)
       if @constellation.save
        flash[:message] = "Created successfully!"
         redirect_to constellation_path(@constellation)
        else
          render :new
        end
    end
    
    private

    def cons_params
        params.require(:constellation).permit(:constellation_name, :star_name, :description, :light_years_away_from_earth, :image_url)
    end

    def set_cons
        @constellation = Constellation.find_by_id(params[:id])
    end
end

