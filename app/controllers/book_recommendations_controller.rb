class BookRecommendationsController < ApplicationController

  before_action :authenticate

  def index
    @book_recommendations = BookRecommendation.all
  end

  def search
    @user = User.find(params[:user_id])
  end

  def results
    @user = User.find(params[:user_id])
    @search = params[:title]
    @results = GoogleBook.search(@search)
    @book = BookRecommendation.new
  end

  def create
    book = BookRecommendation.create(book_recommendation_params)
    book.update(recommendor_id: current_user.id)
    binding.pry
    if book.save
      redirect_to book_rec_message_path(book)
    else
      render(:index)
    end
  end

  # def new
  #   @book_recommendation = BookRecommendation.new
  #   @users = User.all
  # end
  #
  def show
    @book_recommendation = BookRecommendation.find(params[:id])
    @recommendee = User.find(@book_recommendation.recommendee_id)
    @recommendor = User.find(@book_recommendation.recommendor_id)
  end

  def message
    @book_rec = BookRecommendation.find(params[:id])
  end

  def complete
    @book_rec = BookRecommendation.find(params[:id])
    @user = User.find(@book_rec.recommendee_id)
  end
  #
  # def create
  #   @book_recommendation = BookRecommendation.new(book_recommendation_params)
  #   if @book_recommendation.save
  #     redirect_to users_path
  #   else
  #     render(:new)
  #   end
  # end
  #
  # def edit
  #   @book_recommendation = BookRecommendation.find(params[:id])
  #   @users = User.all
  # end
  #
  def update
    @book_recommendation = BookRecommendation.find(params[:id])
    if @book_recommendation.update(book_recommendation_params)
      redirect_to users_path
    else
      render(:edit)
    end
  end

  def destroy
    @book_recommendation = BookRecommendation.find(params[:id])
    @book_recommendation.destroy
  end

  def book_recommendation_params
    params.require(:book_recommendation).permit(:title, :author,
    :year_published, :plot_summary, :img_url, :message, :rating,
    :finished, :user_rating, :recommendee_id, :recommendor_id)
  end


end
