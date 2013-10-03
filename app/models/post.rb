class Post < ActiveRecord::Base
  # post status
  # 0 - ждет модерации
  # 1 - отклонено модератором
  # 2 - принято модератором

  default_scope { order('created_at desc') }
  scope :accepted_posts, -> { where('moderation = ?', 2) }

  belongs_to :user

  attr_accessible :full, :intro, :title

  validates_presence_of :title, :intro, :full
end
