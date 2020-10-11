# class SessionsController < ApplicationController

#     def new
#         @astrophotographer = Astrophotographer.new
#         render :login
#     end

#     def create
#         @astrophotographer = Astrophotographer.find_by(username: params[:astrophotographer][:username])
#         if @astrophotographer && @astrophotographer.authenticate(params[:astrophotographer][:password])
#             session[:astrophotographer_id] = @astrophotographer.id
#             redirect_to astrophotographers_path(@astrophotographer)
#         else
#             redirect_to login_path
#         end
#     end

#     def home
#     end

#     # logout
#     def destroy
#          session.clear
#          redirect_to root_path
#     end
# end
