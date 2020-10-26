class AstrophotographersController < ApplicationController
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
    before_action :set_astro, only: [:show, :edit]

    # layout 'main_page'

    def index
        @astrophotographers = Astrophotographer.alpha
    end

    def show
        # set_astro
        # @astrophotographer = Astrophotographer.find_by_id(params[:id]) 
        # if @astrophotographer
            # redirect_to astrophotographer_path(@astrophotographer)
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
            flash.now[:error] = "Username is already taken. Please try again."
            render :new
        end
    end

    # def edit
    # end 
   
    #Refactor edit
    def edit

    end



    # def edit
    #     set_star
    #     @stargazing = Stargazing.find_by_id(params[:id])
    #     if @stargazing.astrophotographer_id == current_user
    #       render :edit
    #     else
    #       redirect_to constellation_stargazings_path(@constellation, @stargazing)
    #   end


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
        flash.now[:error] = "You have successfully deleted your account!"
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

