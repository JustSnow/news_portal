# models/category.rb
class Category < ActiveRecord::Base
  default_scope { order('created_at desc') }

  has_many :posts, dependent: :destroy

  attr_accessible :name

  validates_presence_of :name
end