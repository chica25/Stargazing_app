# class AstrophotographersController < ApplicationController
#     before_action :set_params, only: [:edit]


#     def index
#         @astrophotographers = Astrophotographer.all
#     end

#     def show
#         @astrophotographer = Astrophotographer.find(params[:id])
#         if !@astrophotographer 
#             redirect_to rooth_path
#         end
#     end


#     #loads the signup form
#     def new
#         @astrophotographer = Astrophotographer.new 
#     end

#     #signup
#     def create
#         @astrophotographer = Astrophotographer.new(astro_params)
#         if @astrophotographer.save
#             session[:astrophotographer_id] = @astrophotographer_id
#             redirect_to astrophotographer_path
#         else
#             render :signup
#         end
#     end
    
   
    # def edit 
    # end

    # def update
    #     @astrophotographer = Astrophotographer.find(params[:id])
    #     @astrophotographer.update(astro_params)
    #     redirect_to astrophotographer_path(@astrophotographer)
    # end

    # def destroy
   
    # end

#     private
#     def astro_params
#         params.require(:astrophotographer).permit(:username, :password, :profile_image, :bio)
#     end

#     def set_params
#         @astrophotographer = Astrophotographer.find(params[:id])
#     end
# end