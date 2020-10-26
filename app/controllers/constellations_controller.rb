class ConstellationsController < ApplicationController
    # before_action :current_user
    before_action :set_cons, only: [:show]


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
       if @constellation.save
         redirect_to constellation_path(@constellation)
        else
          render :new
        end
    end

    # def edit
    #     set_cons
    #     if @constellation.astrophotographer_id == current_user
    #         render :edit
    #     else
    #         redirect_to constellations_path(@constellation)
    #     end 
    # end

    # def update
    #     set_cons #=>@constellation = Constellation.find_by_id(params[:id])
    #     if @constellation.update(cons_params)
    #     redirect_to constellation_path(@constellation)
    #     else
    #         render :edit
    #     end
    # end

    # def update
    #     set_cons
    #     if @constellation.astrophotographer_id != current_user
    #          @constellation.update(cons_params)
    #         # flash.now[:error] = "You're not authorized"
    #         redirect_to constellations_path(@constellation)
    #     else
    #         render :edit
    #     end
    # end


    # def destroy
    #     @constellation = Constellation.find_by_id(params[:id])
    #     if @constellation.astrophotographer_id == current_user
    #         @constellation.destroy
    #         # flash.now[:error] = "Please try again"
           
    #     else 
    #         redirect_to constellations_path
    #     end
    # end

    private

    def cons_params
        params.require(:constellation).permit(:constellation_name, :star_name, :description, :light_years_away_from_earth, :image_url)
    end

    def set_cons
        @constellation = Constellation.find_by_id(params[:id])
    end
end

