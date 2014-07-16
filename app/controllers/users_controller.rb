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
    if @user.update!(user_params)
      redirect_to users_path
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

  def results
    @search = params[:first_name]
    @users = User.where(first_name: @search)
  end

  def recommendations
    @user = User.find(params[:id])
    case params[:type]
    when "movie"
      case params[:kind]
      when "sent"
        @movies = MovieRecommendation.where(recommendor_id: @user.id)
        render :sent_movie_recommendations
      when "received"
        @movies = MovieRecommendation.where(recommendee_id: @user.id)
        render :movie_recommendations
      when "completed"
        @movies = MovieRecommendation.where(recommendee_id: @user.id)
        render :completed_movie_recommendations
      end
    when "book"
      case params[:kind]
      when "sent"
        @books = BookRecommendation.where(recommendor_id: @user.id)
        render :sent_book_recommendations
      when "received"
        @books = BookRecommendation.where(recommendee_id: @user.id)
        render :book_recommendations
      when "completed"
        @books = BookRecommendation.where(recommendee_id: @user.id)
        render :completed_book_recommendations
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email,
    :password, :password_confirmation, :avatar)
  end

end
