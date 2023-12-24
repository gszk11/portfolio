class MoviesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @movies = Movie.page(params[:page])
  end
  
  def search
    @user = User.find(current_user.id)
    @movies = Movie.where('genre LIKE ?', "%#{params[:genre]}%")
    render :index
  end
  
  def show
    @movie = Movie.find(params[:id])
    @user = @movie.user
    @movie_comment = MovieComment.new
  end

  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      redirect_to movie_path(@movie.id), notice: 'レビューを投稿しました。'
    else 
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    if @movie.user_id != current_user.id
      redirect_to movies_path
    end
  end
  
  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie.id), notice: 'レビューを更新しました。'
    else
      render :edit
    end
  end
  
  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to movies_path
  end
  
  private
  def movie_params
    params.require(:movie).permit(:title, :body, :genre)
  end
end