class AstrophotographersController < ApplicationController
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
    before_action :find_astro, only: [:show, :edit]
    
    def new
        @astrophotographer = Astrophotographer.new
    end

    def create
        @astrophotographer = Astrophotographer.new(astro_params)
        if @astrophotographer.save
            session[:astrophotographer_id] = @astrophotographer.id
            redirect_to root_path(@astrophotographer) 
            #redirect_to astrophotographer_path #=> /astrophotographers/#{@astrophotographer.id} - views/show page
        else
            render :new
        end
    end

    def index
        @astrophotographers = Astrophotographer.all
    end

    def show
       # byebug
        @astrophotographer = Astrophotographer.find_by_id(params[:id]) 
        if !@astrophotographer
            redirect_to astrophotographers_path
        end
    end
   
    def edit
    end 

    def update
        @astrophotographer = Astrophotographer.find_by_id(params[:id])
        #@astrophotographer = Astrophotographer.find(id: params[:id])
        if @astrophotographer.update(astro_params)
            redirect_to astrophotographer_path(@astrophotographer)
        else
            render :edit
        end
    end

    def destroy
        @astrophotographer = Astrophotographer.find_by_id(params[:id])
        if @astrophotographer.delete
            redirect_to signup_path
        else
            redirect_to root_path
        end
    end

    private

    def astro_params
        params.require(:astrophotographer).permit(:username, :password, :profile_image, :bio)
    end

    def find_astro
        @astrophotographer = Astrophotographer.find_by_id(params[:id])
    end
end

