class PostModeration < ActionMailer::Base
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  
  default from: "from@example.com"

  def result_moderation_post post
    @post = post
    mail(to: @post.user.try(:email), subject: 'Проверка статьи админом')
  end
end
