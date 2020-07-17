module NotificationsHelper

  def notification_form(notification)
    @visitor = notification.visitor
    @visitor_comment = notification.comment_id
    case notification.action
      when "comment" then
        @comment = Comment.find_by(id: @visitor_comment)&.text
        tag.a(@visitor.username, href:user_path(@visitor), style:"font-weight: bold;")+"さんが"+tag.a('あなたの投稿', href:tweet_path(notification.tweet.id), style:"font-weight: bold;")+"に回答しました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

end