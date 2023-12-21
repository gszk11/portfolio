class MovieCommentsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    comment = MovieComment.new(movie_comment_params)
    comment.user_id = current_user.id
    comment.movie_id = movie.id
    comment.save
    redirect_to movie_path(movie.id)
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