class ConstellationsController < ApplicationController
    before_action :set_cons, only: [:show, :edit]

     def index
         @constellations = Constellation.all.sorted
     end

     def show
    end

    def new
        @constellation = Constellation.new
    end
    
    def create
       @constellation = Constellation.new(cons_params)
       if @constellation
         redirect_to constellation_path(@constellation)
        else
          render :new
        end
    end

    def edit
    end

    def update
        @constellation = Constellation.find_by_id(params[:id])
        @constellation.update(cons_params)

        redirect_to constellation_path(@constellation)
    end

    def destroy
        @constellation = Constellation.find_by_id(params[:id])
        @constellation.destroy
        redirect_to constellations_path
    end

    private

    def cons_params
        params.require(:constellation).permit(:constellation_name, :star_name, :description, :light_years_away_from_earth, :image_url)
    end

    def set_cons
        @constellation = Constellation.find_by_id(params[:id])
    end
end

