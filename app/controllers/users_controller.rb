class UsersController < ApplicationController

  before_action :authenticate, except: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user] = @user.id
      redirect_to users_path
    else
      render(:new)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    binding.pry
    if @user.update!(user_params)
      redirect_to user_path(@user)
    else
      render(:edit)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:current_user] = nil
    redirect_to users_path
  end

  # def recommendations
  #   @user = User.find(params[:id])
  #   case type
  #   when "movie"
  #     case kind
  #     when "sent"
  #       @movies = MovieRecommendation.where(recommendor_id: @user.id)
  #       render 'sent_movie_recommendations'
  #     when "recieved"
  #       @recommendations = MovieRecommendation.where(recommendee_id: @user.id)
  #     when "completed"
  #       @recommendations = MovieRecommendation.where(recommendee_id: @user.id).completed
  #     end
  #   end
  #   when "book"
  #     case kind
  #     when "sent"
  #
  #     when "received"
  #
  #     when "completed"
  #   end
  # end

  def movie_recommendations
    @user = User.find(params[:id])
    @movies = MovieRecommendation.where(recommendee_id: @user.id)
  end

  def completed_movie_recommendations
    @user = User.find(params[:id])
    @movies = MovieRecommendation.where(recommendee_id: @user.id)
  end

  def sent_movie_recommendations
    @user = User.find(params[:id])
    @movies = MovieRecommendation.where(recommendor_id: @user.id)
  end

  def book_recommendations
    @user = User.find(params[:id])
    @books = BookRecommendation.where(recommendee_id: @user.id)
  end

  def completed_book_recommendations
    @user = User.find(params[:id])
    @books = BookRecommendation.where(recommendee_id: @user.id)
  end

  def sent_book_recommendations
    @user = User.find(params[:id])
    @books = BookRecommendation.where(recommendor_id: @user.id)
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email,
    :password, :password_confirmation, :avatar)
  end

end
