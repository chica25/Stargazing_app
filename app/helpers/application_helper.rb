module ApplicationHelper
    def render_navigation
        if session[:astrophotographer_id]
            link_to 'logout', '/logout', method: 'delete'
        else
           link_to('login', '/login') + " " + link_to('signup', '/signup')
        end
    end
end