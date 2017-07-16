class ProfilesController < ApplicationController
    def showProfile
        @user = User.find(params[:id])
    end
    def indexProfile
        #@users = User.all 
        @users = User.all.reverse.take(100)
    end

end