class StargazingsController < ApplicationController
  
  def new
    @stargazing = Stargazing.new #= object that passes the form builder 
  end

  def create
    @stargazing = Stargazing.new(star_params)
    # byebug
    if @stargazing.save
      redirect_to stargazing_path(@stargazing)
    else
      render :new
    end
  end

  def show
    @stargazing = Stargazing.find_by_id(params[:id])
  end

    private

    def star_params
      params.require(:stargazing).permit(:location, :weather, :time, :constellation_id)
    end

end

