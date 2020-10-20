class ConstellationsController < ApplicationController
    before_action :set_cons, only: [:show, :edit]

     def index
    #      #scope 1
         @constellations = Constellation.all.sorted

    #     # scope 2
    #      #@constellations = Constellation.by_titles
    #     #=> total length is greater than a specific number. 
     end

     def show
        @constellation = Constellation.find_by_id(params[:id])
    end


    # search function
    # def index
    #     if params[:constellation_name]
    #       @constellation = Constellation.where('constellation_name LIKE ?', "%#{params[:constellation_name]}%")
    #     else
    #         @constellation = Constellation.all
    #     end
    # end

   
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

    def edit
        #byebug
       @constellation = Constellation.find_by_id(params[:id])
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
        # params.require(:constellation).permit(:constellation_name, :star_name, :image_url, :description, :light_years_away_from_earth, [:location, :weather, :time])
        params.require(:constellation).permit(:constellation_name, :star_name, :description, :light_years_away_from_earth, :image_url)
    end

    def set_cons
        @constellation = Constellation.find_by_id(params[:id])
    end
end

