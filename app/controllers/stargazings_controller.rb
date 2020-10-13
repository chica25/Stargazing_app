class StargazingsController < ApplicationController
    before_action :set_constellation
    before_action :set_stargazing, only: [:show]

    def new
        @stargazing = @constellation.stargazings.new
    end
    
    def create
        @stargazing = current_user.stargazings.new(stargaze_params)
        if @stargazing.save
            redirect_to [@constellation, @stargazing]
        else
            render :new
        end
    end

    def index
        @stargazings = if params[:constellation_id]
            Stargazing.find_by_constellation_id(params[:constellation_id]).alpha_order
        else
            current_user.stargazings
            #Stargazing.all
        end
    end

    def show
        # @stargazing = @constellation.stargazings.find_by_id(params[:id])
    end

    private 

        def stargaze_params
            params.require(:stargazing).permit(:location, :weather, :time, :constellation_id)
        end

        def set_constellation
            @constellation = Constellation.find_by_id(params[:constellation_id])
         end

         def set_stargazing
            @stargazing = @constellation.stargazing.find_by_id(params[:id])
         end
    end

