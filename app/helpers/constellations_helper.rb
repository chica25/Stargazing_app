module ConstellationsHelper

    def error_messages_for(constellation)
        render(:partial => 'application/error_messages', :locals => {:constellation => constellation})
    end

#     def owned?(constellation)
#         constellation.astrophotographer_id == current_user.id
#     end
 end
