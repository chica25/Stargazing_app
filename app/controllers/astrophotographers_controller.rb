class AstrophotographersController < ApplicationController
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
    before_action :set_astro, only: [:edit]

    def index
        @astrophotographers = Astrophotographer.first_five
    end

    def show
         set_astro
         @astrophotographer = Astrophotographer.find_by_id(params[:id])
    end

    def new
        @astrophotographer = Astrophotographer.new
    end

    def create
        @astrophotographer = Astrophotographer.new(astro_params)  
        if @astrophotographer.save
            session[:astrophotographer_id] = @astrophotographer.id
            flash[:message] = "Your account was created"
            redirect_to root_path(@astrophotographer) 
        else
            render :new
        end
    end
  
    def edit
        @astrophotographer = Astrophotographer.find_by_id(params[:id])
         if @astrophotographer && logged_in?
              render :edit
         else
             flash[:error] = "You don't have permission"
        end  
     end


    def update
        @astrophotographer = Astrophotographer.find_by_id(params[:id])
        if @astrophotographer.update(astro_params)
            redirect_to astrophotographer_path(@astrophotographer)
        else
            render :edit
        end
    end

    def destroy
        @astrophotographer = Astrophotographer.find_by_id(params[:id]) 
        @astrophotographer.delete
        flash[:error] = "You have successfully deleted your account!"
        redirect_to signup_path 
    end

    private

    def astro_params
        params.require(:astrophotographer).permit(:username, :password, :password_confirmation, :profile_image, :bio)
    end

    def set_astro
        @astrophotographer = Astrophotographer.find_by_id(params[:id])
    end
end

