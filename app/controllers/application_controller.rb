class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # protect_from_forgery with: :null_session


    before_action :redirect_if_not_logged_in

    helper_method :current_user, :logged_in?

     def logged_in?
    !!session[:astrophotographer_id]
     current_user
     end

     def logged_in?
        !!current_user 
    end

    def redirect_if_not_logged_in
        redirect_to login_path unless logged_in?
     end

    def current_user
        # @astrophotographer ||= Astrophotographer.find_by_id(session[:user_id]) 
        #   Astrophotographer.find_by(id: session[:astrophotographer_id]) if session[:astrophotographer_id]
        #   Astrophotographer.find_by(id: session[:astrophotographer_id]) if session[:astrophotographer_id] if session[:astrophotographer_id]
           @current_user ||= Astrophotographer.find_by_id(session[:astrophotographer_id]) if session[:astrophotographer_id]
        # @current_user ||= Astrophotographer.find(session[:astrophotographer_id])
        #if the current user is true it will set it equal to the user in the current session
    end


end
