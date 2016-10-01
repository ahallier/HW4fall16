class UsersController < ApplicationController

  def user_params
    params.require(:user_id, :email)
  end

  def show
    #id = params[:id] # retrieve movie ID from URI route
    #@movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.all
  end

  def new
    # default: render 'new' template
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

  def edit
    #@movie = Movie.find params[:id]
  end

  def update
    #@movie = Movie.find params[:id]
    #@movie.update_attributes!(movie_params)
    #flash[:notice] = "#{@movie.title} was successfully updated."
    #redirect_to movie_path(@movie)
  end

  def destroy
    #@movie = Movie.find(params[:id])
    #@movie.destroy
    #flash[:notice] = "Movie '#{@movie.title}' deleted."
    #redirect_to movies_path
  end

end
