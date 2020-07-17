class HomeController < ApplicationController
  def index
    @tweets = Tweet.all.order("created_at DESC").page(params[:page]).per(3)
    @comments = Comment.all.order("created_at DESC").page(params[:page]).per(7)
  end
end
