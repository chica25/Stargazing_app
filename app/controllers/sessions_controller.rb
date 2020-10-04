class SessionsController < ApplicationController

    def new
        @astrophotographer = Astrophotographer.new
        render :login
    end

    def create
        @astrophotographer = Astrophotographer.find_by(username: params[:astrophotographer][:username])
        if @astrophotographer && @astrophotographer.authenticate(params[:astrophotographer][:password])
            session[:astrophotographer_id] = @astrophotographer.id
            redirect_to astrophotographer_path
        else
            redirect_to 'login'
        end
    end

    def show
    end

    def home
    end

    #logout
    def destroy
        session.clear
        redirect_to '/'
    end
end
