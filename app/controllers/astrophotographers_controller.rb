class AstrophotographersController < ApplicationController
    before_action :set_params, only: [:edit, :show]

    #loads the signup form
    def new
        @astrophotographer = Astrophotographer.new 
        render :signup
    end

    #signup
    def create
        @astrophotographer = Astrophotographer.new 

    
    end
    
    def index 
        @astrophotographers = Astrophotographer.all
    end

    def show

    end

    def edit 
    end

    def update
        @astrophotographer = Astrophotographer.find(params[:id])
        @astrophotographer.update(astro_params)
        redirect_to astrophotographer_path(@astrophotographer)
    end

    private

    def astro_params
        params.require(:astrophotographer).permit(:username, :password, :profile_image, :bio)
    end

    def set_params
        @astrophotographer = Astrophotographer.find(params[:id])
    end
end