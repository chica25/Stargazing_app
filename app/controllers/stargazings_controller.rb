class StargazingsController < ApplicationController
  before_action :set_star, only: [:show, :edit, :update, :destroy]

  def index
    if params[:constellation_id] && @constellation = Constellation.find_by_id(params[:constellation_id])
      @stargazings = @constellation.stargazings
    else
      @stargazings = Stargazing.all
    end
 end

  def show
    @stargazing = Stargazing.find_by_id(params[:id]) 
    @constellation = @stargazing.constellation
  end
  
  def new
    @stargazing = Stargazing.new  
  end

  def create
    @stargazing = current_user.stargazings.new(star_params)
    if @stargazing.save
      flash[:message] = "Created successfully!"
       redirect_to constellation_stargazing_path(@stargazing.constellation, @stargazing)
    else
      render :new
      # redirect_to new_stargazing_path
    end
  end
 
  def edit
      @stargazing = Stargazing.find_by_id(params[:id]) 
      @constellation = Constellation.find_by_id(params[:constellation_id])
      if @stargazing.astrophotographer != current_user
      redirect_to constellation_stargazings_path(@constellation, @stargazing)
    end
  end

  def update
     @stargazing = Stargazing.find_by_id(params[:id])
    if @stargazing.astrophotographer == current_user
      @stargazing.update(star_params)
      flash[:message] = "Updated successfully!"
      redirect_to constellation_stargazing_path(@stargazing.constellation, @stargazing)
    else
      flash[:error] = "You're not authorize to edit this Stargazing"
         redirect_to constellation_stargazings_path(@stargazing.constellation)
    end
  end

    def destroy
      @stargazing = Stargazing.find_by_id(params[:id])
      @constellation = Constellation.find_by_id(params[:constellation_id])
      if @stargazing.astrophotographer == current_user
          @stargazing.destroy
          
      end
      flash[:error] = "You don't have access"
      redirect_to stargazings_path(@stargazing)
  end

    private

    def star_params
      params.require(:stargazing).permit(:location, :weather, :time, :constellation_id, :created_at)
    end

    def set_star
      @stargazing = Stargazing.find_by_id(params[:id])
    end

end

