module ApplicationHelper

    def render_navigation
        if session[:astrophotographer_id]
            link_to 'logout', '/logout', method: 'delete'
        else
           link_to('Login', '/login') + " " + link_to('Sign Up', '/signup')
        end
    end
 end

#  def error_messages_for(astrophotographer)
#     render(:partial => 'application/error_messages', locals => {:astrophotographer => astrophotographer})
#  end 
