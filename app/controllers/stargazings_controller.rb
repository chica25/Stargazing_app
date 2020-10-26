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

     def index
         if params[:constellation_id] && @constellation = Constellation.find_by_id(params[:id])
             @stargazings = @constellation.stargazings
        else
            #add flash error message
           @stargazings = Stargazing.all
        end
   end

  def show
    @stargazing = Stargazing.find_by_id(params[:id])
  end

   def edit
      @stargazing = Stargazing.find_by_id(params[:id])
   end


   def update
    set_star #=>@constellation = Constellation.find_by_id(params[:id])
    if @stargazing.update(star_params)
    redirect_to stargazing_path(@stargazing)
    else
        render :edit
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

