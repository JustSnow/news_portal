class Subscription < ActiveRecord::Base
	default_scope { order('created_at desc') }

	belongs_to :user
	belongs_to :category

	attr_accessible :name, :category_id

	validates_presence_of :name, :category_id
end