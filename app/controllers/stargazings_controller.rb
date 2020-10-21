class StargazingsController < ApplicationController
     before_action :set_stargazing, only: [:edit]

    def new      
        @constellation = Constellation.find_by_id(params[:constellation_id])
        @stargazing = Stargazing.new
     end

    def create
        @stargazing = Stargazing.new(star_params)
        if @stargazing.save
  
            redirect_to stargazing_path(@stargazing)
        else
            render :new
        end
    end

    def show
        @stargazing = Stargazing.find_by_id(params[:id])
    end

    def index 
      @stargazings = if params[:constellation_id]
           Constellation.find_by_constellation_id(params[:constellation_id])
        else
            @stargazings = Stargazing.all
         end
    end

    private
    def star_params
        params.require(:stargazing).permit(:location, :weather, :time, :constellation_id)
    end

    def set_stargazing
            @stargazing = Stargazing.find_by_id(params[:id])
        end 
    end



#     def update
#         @stargazing = Stargazing.find_by_id(params[:id])
#         if current_user.stargazings.update(stargaze_params)
#             redirect_to constellation_stargazing_path(@stargazing)   
#         else
#             render :edit
#         end
#     end

#     def destroy
#         @stargazing = Stargazing.find_by_id(params[:id])
#         @stargazing.destroy
#         redirect_to stargazings_path
#     end

