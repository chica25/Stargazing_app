class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

     def logged_in?
     !session[:astrophotographer_id]
     end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
     end

     #private
    def current_user
        @astrophotographer ||= Astrophotographer.find_by_id(session[:astrophotographer_id])
        #if the current user is true it will set it equal to the user in the current session
    end
end
