class StargazingsController < ApplicationController
  before_action :set_star, only: [:show, :edit]

  
  def new
    @stargazing = Stargazing.new  
  end

  def create
    @stargazing = current_user.stargazings.new(star_params)
    # @stargazing = Stargazing.new(star_params)
    if @stargazing.save
      redirect_to stargazing_path(@stargazing)
    else
      render :new
    end
  end

     def index
         if params[:constellation_id] && @constellation = Constellation.find_by_id(params[:id])
             @stargazings = @constellation.stargazings
        else
            #add flash error message
           @stargazings = Stargazing.all
        end
   end

  def show
  end

  def edit
    set_star
    if @stargazing.astrophotographer_id == current_user
      render :edit
    else
      redirect_to constellation_stargazing_path(@constellation)
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
    if @stargazing.astrophotographer_id != current_user
      @stargazing.update(star_params)
      redirect_to stargazing_constellation_path(@constellation)
    else
        redirect_to constellation_stargazings_path(@constellation)
    end
  end
    # def update
    #     set_cons
    #     if @constellation.astrophotographer_id != current_user
    #          @constellation.update(cons_params)
    #         # flash.now[:error] = "You're not authorized"
    #         redirect_to constellations_path(@constellation)
    #     else
    #         render :edit
    #     end
    # end

    def destroy
        @constellation = Constellation.find_by_id(params[:id])
        if @stargazing.astrophotographer_id == current_user
            @stargazing.destroy 
        else 
          # flash.now[:error] = "Please try again"
            redirect_to constellation_stargazings_path
        end
    end

# def destroy
#     set_star #=>@constellation = Constellation.find_by_id(params[:id])
#     if @stargazing.destroy
#         redirect_to stargazings_path
#     else 
#         flash.now[:error] = "Please try again"
#     end
# end

    private

    def star_params
      params.require(:stargazing).permit(:location, :weather, :time, :constellation_id)
    end

    def set_star
      @stargazing = Stargazing.find_by_id(params[:id])
    end

end

