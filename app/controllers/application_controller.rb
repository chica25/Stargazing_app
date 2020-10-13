class ApplicationController < ActionController::Base

    def current_user
        @astrophotographer ||= Astrophotographer.find_by_id(session[:astrophotographer_id])
        #if the current user is true it will set it equal to the user in the current session
    end
end
