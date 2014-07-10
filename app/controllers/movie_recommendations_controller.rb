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
    movie.update(recommender_id: current_user.id)
    # this is where we set up recommendation
    # this is a post request
    binding.pry
  end
  #
  # def new
  #   @movie_recommendation = MovieRecommendation.new
  #   @users = User.all
  # end
  #
  # def show
  #   @movie_recommendation = MovieRecommendation.find(params[:id])
  #   @recommendee = User.find(@movie_recommendation.recommendee_id)
  #   @recommendor = User.find(@movie_recommendation.recommendor_id)
  # end
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
  # def update
  #   @movie_recommendation = MovieRecommendation.find(params[:id])
  #   if @movie_recommendation.update(movie_recommendation_params)
  #     redirect_to movie_recommendation_path(@movie_recommendation)
  #   else
  #     render(:edit)
  #   end
  # end
  #
  # def destroy
  #   @movie_recommendation = MovieRecommendation.find(params[:id])
  #   @movie_recommendation.destroy
  # end

  def movie_recommendation_params
    params.require(:movie_recommendation).permit(:title, :director, :actors,
    :year_released, :plot_summary, :img_url, :message, :rating, :media_type,
    :finished, :user_rating, :recommendee_id)
  end


end
