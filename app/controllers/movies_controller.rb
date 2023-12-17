class MoviesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :new
    end
  end

  def edit
  end
  
  private
  def movie_params
    params.require(:movie).permit(:title, :body, :genre)
  end
end