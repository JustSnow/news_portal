class SubscriptionsController < ApplicationController
	before_filter :get_subscription, only: [:update, :destroy]
	
	def index
		@subscriptions = Subscription.all
	end

	def new
		@subscription = current_user.subscriptions.build
	end

	def create
		@subscription = current_user.subscriptions.build(params[:subscription])

		if @subscription.save
			redirect_to subscriptions_path, notice: "Подписка #{@subscription.name} успешно сохранена"
		else
			render 'new'
		end
	end

	def update
		if @subscription.update_attributes(params[:subscription])
			redirect_to subscriptions_path, notice: "Подписка #{@subscription.name} успешно обновлена"
		else
			render 'index'
		end
	end

	def destroy
		@subscription.destroy
		redirect_to subscriptions_path, notice: "Подписка #{@subscription.name} успешно удалена"
	end

	private
		def get_subscription
			@subscription = Subscription.find(params[:id])
		end
end