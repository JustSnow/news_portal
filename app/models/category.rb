class Category < ActiveRecord::Base
  default_scope order('id desc')

  has_many :posts

  attr_accessible :name
end