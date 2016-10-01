class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:user_id, :email, :session_token)
    end
    def index
        redirect_to new_user_path
    end
    
    def new
    end
    
    def create
        if User.exists?(:user_id => user_params[:user_id])
            flash[:notice] = "Sorry, this user_id is taken. Try again."
            redirect_to users_path
        else
            temp = user_params
            temp[:session_token] = SecureRandom.base64
            user = User.create!(temp)
            flash[:notice] = "Welcome #{user.user_id}. Your account has been created"
            redirect_to login_path
        end
    end
end
