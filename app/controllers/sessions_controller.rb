 class SessionsController < ApplicationController

     def new
         @astrophotographer = Astrophotographer.new
    end

    def create
         astrophotographer = Astrophotographer.find_by(username: params[:astrophotographer][:username])
        if astrophotographer && astrophotographer.authenticate(params[:astrophotographer][:password])
             session[:astrophotographer_id] = astrophotographer.id
            redirect_to constellations_path
         else
            render :new
        end
     end

     def omniauth(auth)
          astrophotographer = Astrophotographer.from_omniauth(request.env[])
     end

#     # logout
    def destroy
         session.clear
         redirect_to '/'
    end

    protected 

    def auth
     request.env['omniauth.auth']
    end
end
