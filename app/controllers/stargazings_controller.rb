class StargazingsController < ApplicationController
    before_action :set_constellation
    before_action :set_stargazing, only: [:show]

    def new
        if params[:constellation_id] && @constellation = Constellation.find_by_id(params[:constellation_id])
            @stargazing = @constellation.stargazings.build
        else
            @error = "Does not exist!"
            @stargazing = Stargazing.new
        end
    end
 
    def create
        #byebug
        @stargazing = Stargazing.new(stargaze_params)
        if @stargazing.save
            # redirect_to (@stargazing)
            redirect_to stargazing_path
        else
            render :new
        end
    end

     def index
        @stargazings = Stargazing.all
        # if it's nested
        if params[:constellation_id] && @constellation = Constellation.find_by_id(params[:constellation_id])
            @stargazings = @constellation.stargazings
      
        #      else
        #         # not nested
        #         redirect_to new_stargazing_path
        #      flash.now[:message] = "wrong Stargazing post" if (params[:constellation_id])
        end
    end
        #byebug
        #@stargazings = if params[:constellation_id]
          # Stargazing.find_by_constellation_id(params[:constellation_id]).alpha_order
           #redirect_to constellation_stargazings_path
        #else
   
         #@stargazings = Stargazing.all
       # end
    # end

    def show
         @stargazing = @constellation.stargazings.find_by_id(params[:constellation_id])
    end

    private 

        def stargaze_params
            params.require(:stargazing).permit(:location, :weather, :time, :constellation_id)
        end

        def set_constellation
            @constellation = Constellation.find_by_id(params[:constellation_id])
         end

         def set_stargazing
            @stargazing = @constellation.stargazings.find_by_id(params[:id])
         end
    end

