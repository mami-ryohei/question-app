class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @tweets = Tweet.all.order("created_at DESC").page(params[:page]).per(6)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
    @comment = Comment.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweet_path(@tweet), notice: "投稿しました"
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
    if @tweet.user != current_user
      redirect_to tweets_path, alert: "不正なアクセスです"
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet), notice: "更新しました"
    else
      render :edit
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :body, :image)
  end

end
