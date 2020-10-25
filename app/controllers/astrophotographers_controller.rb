class AstrophotographersController < ApplicationController
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
    before_action :set_astro, only: [:show, :edit]

    # layout 'astro_1.jpg'

    def index
        @astrophotographers = Astrophotographer.alpha
    end

    def show
        set_astro #=> @astrophotographer = Astrophotographer.find_by_id(params[:id]) 
   #@astrophotographer = Astrophotographer.find_by_id(params[:id]) 
        # if !@astrophotographer
        #     redirect_to root_path
        end
  
    
    def new
        @astrophotographer = Astrophotographer.new
    end

    def create
        @astrophotographer = Astrophotographer.new(astro_params)  
        if @astrophotographer.save
            session[:astrophotographer_id] = @astrophotographer.id
            flash.now[:message] = "Your account was created"
            redirect_to root_path(@astrophotographer) 
        else
            flash.now[:error] = "Username is too short"
            render :new
        end
    end

   
   
    def edit
    end 
   
    def update
        set_astro #=> @astrophotographer = Astrophotographer.find_by_id(params[:id]) 
        if @astrophotographer.update(astro_params)
            redirect_to astrophotographer_path(@astrophotographer)
        else
            render :edit
        end
    end

    def destroy
        set_astro #=> @astrophotographer = Astrophotographer.find_by_id(params[:id]) 
        @astrophotographer.delete
        redirect_to signup_path
        flash.now[:error] = "You have successfully deleted your account!"
        end

    private

    def astro_params
        params.require(:astrophotographer).permit(:username, :password, :password_confirmation, :profile_image, :bio)
    end

    def set_astro
        @astrophotographer = Astrophotographer.find_by_id(params[:id])
    end
end

