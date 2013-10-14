class UserSubscriptions < ActionMailer::Base
	include Sidekiq::Worker
  sidekiq_options queue: "high"

  default from: "from@example.com"

  def send_subscription user
  	@user = user
  	mail(to: @user.email, subject: 'Subsciptions')
  end

  def send_post_user_signed user, post, category
  	@user = user
  	@post = post
  	@category = category

  	mail(to: @user.email, subject: 'Subscriptions')
  end
end