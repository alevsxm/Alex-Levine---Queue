class MovieRecommendationsController < ApplicationController

  before_action :authenticate

  def index
    @movie_recommendations = MovieRecommendation.all
  end

  def search
    @user = User.find(params[:user_id])
  end

  def results
    @user = User.find(params[:user_id])
    @search = params[:title]
    @results = OMDB.search(@search)
    @movie = MovieRecommendation.new
  end

  def create
    movie = MovieRecommendation.create(movie_recommendation_params)
    movie.update(recommendor_id: current_user.id)
    if movie.save
      redirect_to movie_rec_message_path(movie)
    else
      render(:index)
    end
  end

  #
  # def new
  #   @movie_recommendation = MovieRecommendation.new
  #   @users = User.all
  # end
  #
  def show
    @movie_recommendation = MovieRecommendation.find(params[:id])
    @recommendee = User.find(@movie_recommendation.recommendee_id)
    @recommendor = User.find(@movie_recommendation.recommendor_id)
  end

  def message
    @movie_rec = MovieRecommendation.find(params[:id])
  end

  def complete
    @movie_rec = MovieRecommendation.find(params[:id])
    @user = User.find(@movie_rec.recommendee_id)
  end
  #
  # def create
  #   @movie_recommendation = MovieRecommendation.new(movie_recommendation_params)
  #   if @movie_recommendation.save
  #     redirect_to movie_recommendations_path
  #   else
  #     render(:new)
  #   end
  # end
  #
  # def edit
  #   @movie_recommendation = MovieRecommendation.find(params[:id])
  #   @users = User.all
  # end
  #
  def update
    @movie_recommendation = MovieRecommendation.find(params[:id])
    if @movie_recommendation.update(movie_recommendation_params)
      redirect_to users_path
    else
      render(:edit)
    end
  end
  #
  def destroy
    @movie_recommendation = MovieRecommendation.find(params[:id])
    @movie_recommendation.destroy
      redirect_to movie_recommendations_path
  end

  def movie_recommendation_params
    params.require(:movie_recommendation).permit(:title, :director, :actors,
    :year_released, :plot_summary, :img_url, :message, :rating, :media_type,
    :finished, :user_rating, :recommendee_id)
  end


end
