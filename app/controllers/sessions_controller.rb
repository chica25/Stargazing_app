 class SessionsController < ApplicationController
     skip_before_action :redirect_if_not_logged_in

     def new
         @astrophotographer = Astrophotographer.new
     end

     def create
          @astrophotographer = Astrophotographer.find_by(username: params[:astrophotographer][:username])
          if @astrophotographer && @astrophotographer.authenticate(params[:astrophotographer][:password])
               session[:astrophotographer_id] = @astrophotographer.id
               redirect_to root_path
          else
               flash.now[:error] = "Wrong login. Please try again."
               render :new
          end
     end

     def omniauth
          byebug
          @astrophotographer = Astrophotographer.from_omniauth(auth)
          if @astrophotographer.valid?
               session[:astrophotographer_id] = @astrophotographer.id
               redirect_to root_path   
          else
               redirect_to login_path 
          end
     end

     def destroy
          session.clear 
          redirect_to login_path
     end

     protected 

     def auth
          request.env['omniauth.auth']
     end
end
