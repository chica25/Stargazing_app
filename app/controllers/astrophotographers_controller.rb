class AstrophotographersController < ApplicationController
    before_action :set_params, only: [:edit, :update]

    #loads the signup form
    def new
        @astrophotographer = Astrophotographer.new 
        render :signup 
    end

    #signup
    def create
        @astrophotographer = Astrophotographer.create(astro_params)
        if @astrophotographer.save
            #login the user
            session[:astrophotographer_id] = @astrophotographer.id
            redirect_to astrophotographer_path
        else
            redirect_to :signup
        end
    end
    
    def index 
        @astrophotographers = Astrophotographer.all
    end

    def edit 
    end

    def update
        @astrophotographer.update(astro_params)
        redirect_to astrophotographer_path(@astrophotographer)
    end

private
    def astro_params
        params.require(:astrophotographer).permit(:username, :password)
    end

    def set_params
        @astrophotographer = Astrophotographer.find(params[:id])
    end
end