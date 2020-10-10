class StargazingsController < ApplicationController
    def new 
        @stargazing = Stargazing.new
    end
    
    def create
        #byebug
        @stargazing = Stargazing.new( stargazing_params)
        if @stargazing.save
            redirect_to stargazing_path(@stargazing)
        else
            render :new
        end
    end

    private 
    def stargazing_params
        params.require(:stargazing).permit(:location, :weather, :time)
    end
end