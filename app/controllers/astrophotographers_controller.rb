class AstrophotographersController < ApplicationController
    before_action :set_params, only: [:show, :edit]
    
    def new
        @astrophotographer = Astrophotographer.new
    end

    def create
        @astrophotographer = Astrophotographer.new(astro_params)
        if @astrophotographer.save
            session[:astrophotographer_id] = @astrophotographer.id
            redirect_to root_path

        else
            render :new
        end
    end

    def index
        @astrophotographers = Astrophotographer.all
    end

    def show
        @astrophotographer = Astrophotographer.find_by_id(params[:id])
        # redirect_to '/welcome' if !@astrophotographer
    end
   
    def edit
   
    end

    def update
        @astrophotographer = Astrophotographer.find(params[:id])
        @astrophotographer.update(astro_params)
        redirect_to '/'
    end

    private
    def astro_params
        params.require(:astrophotographer).permit(:username, :password, :profile_image, :bio)
    end

    def set_params
        @astrophotographer = Astrophotographer.find(params[:id])
    end
end