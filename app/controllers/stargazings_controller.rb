class StargazingsController < ApplicationController
    before_action :set_stargazing, only: [:edit, :show]

    def index
        @stargazings = Stargazing.all
        #  @stargazings = Stargazing.find_by_constellation_id(params[:constellation_id])
     end
    
    #  def index
    #    if params[:constellation_id]
    #     @stargazings = Constellation.find(params[:constellation_id]).stargazings
    #    else
    #     stargazings = Stargazing.all
    #    end
    # end

     def show
     end

    def new
        @stargazing = Stargazing.new
        @constellation = Constellation.find_by_id(params[:constellation_id]) if params[:constellation_id]
    end

    def create
        @stargazing = current_user.stargazings.new(stargaze_params)
        if @stargazing.save
            redirect_to stargazing_path(@stargazing)
        else
            render :new
        end
    end

    def edit 
        set_stargazing
    end

    def update
        @stargazing = Stargazing.find_by_id(params[:id])
        if current_user.stargazings.update(stargaze_params)
            redirect_to constellation_stargazing_path(@stargazing)   
        else
            render :edit
        end
    end

    def destroy
        @stargazing = Stargazing.find_by_id(params[:id])
        @stargazing.destroy
        redirect_to stargazings_path
    end
    
    private

    def stargaze_params
        params.require(:stargazing).permit(:location, :weather, :time, :constellation_id)
    end

    def set_stargazing
        @stargazing = Stargazing.find_by_id(params[:id])
    end

end

