class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.create(comment_params)
    @tweet = @comment.tweet
    redirect_to "/tweets/#{@comment.tweet.id}"
    @tweet.create_notification_comment!(current_user, @comment.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :image).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end