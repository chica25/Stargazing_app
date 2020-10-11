# class StargazingsController < ApplicationController
#     def new 
#         @stargazing = Stargazing.new
#     end
    
#     def create
#         #byebug
#         @stargazing = Stargazing.new(stargaze_params)
#         if @stargazing.save
#             redirect_to stargazing_path(@stargazing)
#         else
#             render :new
#         end
#     end

# #   def index
# #     @stargazings = Stargazing.all
# #   end

#     def show
#         @stargazing = Stargazing.find_by_id(params[:id])
#     end

#     private 
#     def stargaze_params
#         params.require(:stargazing).permit(:location, :weather, :time, :constellation_id)
#     end
# end

