class Category < ActiveRecord::Base
  default_scope { order('created_at desc') }

  has_many :posts, dependent: :destroy
  belongs_to :admin

  attr_accessible :name

  validates_presence_of :name
end