class MovieCommentsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    @movie_comment = MovieComment.new(movie_comment_params)
    @movie_comment.user_id = current_user.id
    @movie_comment.movie_id = movie.id
    if @movie_comment.save
      redirect_to movie_path(movie.id)
    else
      @movie = Movie.find(params[:movie_id])
      @user = @movie.user
      render "movies/show"
    end
  end
  
  def destroy
    MovieComment.find_by(id: params[:id]).destroy
    redirect_to movie_path(params[:movie_id])
  end
  
  private
  def movie_comment_params
    params.require(:movie_comment).permit(:comment)
  end
end