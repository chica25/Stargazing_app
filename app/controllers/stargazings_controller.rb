class StargazingsController < ApplicationController
  before_action :set_star, only: [:show, :edit, :update, :destroy]

  
  def new
    @stargazing = Stargazing.new  
  end

  def create
    @stargazing = current_user.stargazings.new(star_params)
    if @stargazing.save
       redirect_to constellation_stargazing_path(@stargazing.constellation, @stargazing)
    else
      render :new
    end
  end
        #code 1
    def index
      if params[:constellation_id] && @constellation = Constellation.find_by_id(params[:constellation_id])
        @stargazings = @constellation.stargazings
      else
            #add flash error message
        @stargazings = Stargazing.all
      end
   end

  def show
    set_star
    @stargazing = Stargazing.find_by_id(params[:id])
    @constellation = @stargazing.constellation
  end

  def edit
    #  set_star
      @stargazing = Stargazing.find_by_id(params[:id])
      @constellation = Constellation.find_by_id(params[:constellation_id])
      if @stargazing.astrophotographer != current_user
      redirect_to constellation_stargazings_path(@constellation, @stargazing)
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

  def update
     @stargazing = Stargazing.find_by_id(params[:id])
    if @stargazing.astrophotographer == current_user
      @stargazing.update(star_params)
      # flash[:message] = "New list updated successfully!"
      redirect_to constellation_stargazing_path(@stargazing.constellation, @stargazing)
     else
         redirect_to constellation_stargazings_path(@stargazing.constellation)
    end
  end

    def destroy
      @constellation = Constellation.find_by_id(params[:constellation_id])
      if @stargazing.astrophotographer == current_user
          @stargazing.destroy
          # flash.now[:error] = "Please try again"
      end
      redirect_to constellation_stargazings_path(@constellation)
  end


    private

    def star_params
      params.require(:stargazing).permit(:location, :weather, :time, :constellation_id)
    end

    def set_star
      @stargazing = Stargazing.find_by_id(params[:id])
    end

end

