class UsersController < ApplicationController
    def new
    end
    
    def create
        if User.exists?(params[:user_id])
            flash[:notice] = "Sorry, this user_id is taken. Try again."
            redirect_to users/new
        else
            @user = User.create_user!(params)
            flash[:notice] = "Welcome #{params[:user_id]}. Your account has been created"
            redirect_to movies_path
        end
    end
end
