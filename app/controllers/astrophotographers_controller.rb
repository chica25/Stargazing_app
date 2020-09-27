class AstrophotographersController < ApplicationController
    before_action :set_params, only: [:show, :edit, :update]

    def index 
        @astrophotographers = Astrophotographer.all
    end

    def new
        @astrophotographer = Astrophotographer.new   
    end

    def show
        set_params
    end

    def create
        @astrophotographer = Astrophotographer.create(astro_params)
        if @astrophotographer.save
            redirect_to astrophotographer_path(@astrophotographer)
        else
            render :new
        end
    end

    def edit 
        set_params
    end

    def update
        @astrophotographer.update(astro_params)
        redirect_to astrophotographer_path(@astrophotographer)
    end

private
    def astro_params
        params.require(:astrophotographer).permmit(:username, :password_digest)
    end

    def set_params
        @astrophotographer = Astrophotographer.find(params[:id])
    end
end