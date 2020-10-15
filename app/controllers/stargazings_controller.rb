class StargazingsController < ApplicationController
    before_action :set_constellation
   # before_action :set_stargazing, only: [:show]

    def new 
        @constellation_id = params[:constellation_id] if params[:constellation_id]
        @stargazing = Stargazing.new
    end
#
    # def new
    #     if params[:constellation_id] && @constellation = Constellation.find_by_id(params[:constellation_id])
    #         @stargazing = @constellation.stargazings.build
    #     else
    #         @error = "Does not exist!"
    #         @stargazing = Stargazing.new
    #     end
     
 
    def create
        #byebug
        @stargazing = Stargazing.new(stargaze_params)
        if @stargazing.save
            # redirect_to (@stargazing)
            redirect_to stargazing_path(@stargazing)
        else
            render :new
        end
    end

    def show
        @stargazing = Stargazing.find_by_id(params[:id])
      #   @stargazing = @constellation.stargazings.find_by_id(params[:constellation_id])
    end

     def index
        @stargazing = if params[:constellation_id]
            @stargazings = Stargazing.find_by_constellation_id([:constellation_id])
        else
            @stargazings = Stargazing.all
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

 
    def edit 
        set_constellation
    end

    def update
        @stargazing = Stargazing.find_by_id(params[:id])
        @stargazing.update(stargaze_params)
        redirect_to stargazing_path(@stargazing)
    end

    def destroy
        @stargazing = Stargazing.find_by_id(params[:id])
        @stargazing.destroy
        redirect_to stragazings_path
    end

    private 

        def stargaze_params
            params.require(:stargazing).permit(:location, :weather, :time, :constellation_id)
        end

        def set_constellation
            @stargazing = Stargazing.find_by_id(params[:id])
         end

         def set_stargazing
            @stargazing = @constellation.stargazing.find_by_id(params[:id])
         end
    end

