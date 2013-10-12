namespace :subscriptions do
	task :send_subscr => :environment do
		User.find(:all).each do |user|
			UserSubscriptions.delay.send_subscription(user) unless user.try(:subscriptions).empty?
		end
	end
end