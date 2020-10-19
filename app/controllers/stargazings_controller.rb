class StargazingsController < ApplicationController
    before_action :set_stargazing

   
    def new
        @stargazing = Stargazing.new
        @constellation = Constellation.find_by_id(params[:constellation_id]) if params[:constellation_id]
    end

    def create
        byebug
        @stargazing = current_user.stargazings.new(stargaze_params)
        if @stargazing.save
          #  byebug
            redirect_to stargazing_path(@stargazing)
        else
            render :new
        end
    end

   
        #-- nested --
    # def new
    #     @stargazing = Stargazing.new(stargaze_params)
    #     if params[:constellation_id] && @constellation = Constellation.find_by_id(params[:constellation_id])
    #         @stargazing = @constellation.stargazings.build
    #     else
    #         @error = "Does not exist!"
    #         @stargazing = Stargazing.new
    #      end
    # end
 
   
    def index
        @stargazings = Stargazing.all
    end

    def show
        set_stargazing
    end
 
    def edit 
        set_stargazing
    end

    def update
        @stargazing = Stargazing.find_by_id(params[:id])
        if @stargazing.update(stargaze_params)
            redirect_to stargazing_path(@stargazing)
        else
            render :edit
    end
end

    def destroy
        @stargazing = Stargazing.find_by_id(params[:id])
        @stargazing.delete
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


          #-- nested --
        #  @stargazing = Stargazing.new
        # @constellation_id = params[:constellation_id] if params[:constellation_id]
        # @stargazing = Stargazing.new
    # end

    # def create
    #     def 
        #-- nested --
        # @stargazing = Stargazing.new(stargaze_params)
        # if params[:constellation_id] && @constellation = Constellation.find_by_id(params[:constellation_id])
        #     @stargazing = @constellation.stargazings.build
        # else
        #     @error = "Does not exist!"
        #     @stargazing = Stargazing.new
    #     # end
    # end
 
    # def create
    #     #byebug
    #     @stargazing = Stargazing.new(stargaze_params)
    #     if @stargazing.save
    #         redirect_to stargazing_path(@stargazing)
    #     else
    #         render :new
    #     end
    # end

#     def show
#         @stargazing = Stargazing.find_by_id(params[:id])
#         @stargazing = @constellation.stargazings.find_by_id(params[:constellation_id])
#     end

#      def index
#         if params[:constellation_id]
#             @stargazings = Stargazing.by_titles
#         else
#             @stargazings = Constellation.all
#     end
# end
   
        #byebug
        #@stargazings = if params[:constellation_id]
          # Stargazing.find_by_constellation_id(params[:constellation_id]).alpha_order
           #redirect_to constellation_stargazings_path
        #else
   
         #@stargazings = Stargazing.all
       # end
    # end
