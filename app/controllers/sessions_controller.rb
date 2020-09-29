class SessionsController < ApplicationController

    def new
        render :login
    end

    def create
    end

    def home
    end

    #logout
    def destroy
        session.clear
        redirect_to '/'
    end
end
