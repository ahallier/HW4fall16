class SessionsController < ApplicationController
    
    def session_params
        params.require(:user).permit(:user_id, :email)
    end
    
    def index
        redirect_to new_user_path
    end
    
    def new
    end
    
    def create
        if User.exists?(:user_id => session_params[:user_id])
           if User.find_by_user_id session_params[:user_id]
                user = User.find_by_user_id session_params[:user_id]
                if user.email != session_params[:email]
                    flash[:notice] = "Invalid user-id/email combination."
                    redirect_to login_path
                    return
                end
                session[:session_token] = user.session_token
                flash[:notice] = "You are logged in as #{session_params[:user_id]}"
                redirect_to movies_path
           end
        else
            flash[:notice] = "Invalid user_id or user_id email combo."
            redirect_to login_path
        end 
            
    end
    
    def destroy
        session[:session_token] = nil
        redirect_to movies_path
    end

end
