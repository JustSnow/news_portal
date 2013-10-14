class UserSubscriptions < ActionMailer::Base
	include Sidekiq::Worker
  sidekiq_options queue: "high"

  default from: "from@example.com"

  def send_subscription user
  	@user = user
  	mail(to: @user.email, subject: 'Sybsciptions')
  end
end