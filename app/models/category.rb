# models/category.rb
class Category < ActiveRecord::Base
  default_scope { order('created_at desc') }

  has_and_belongs_to_many :posts
  has_many :subscriptions

  attr_accessible :name

  validates_presence_of :name
end