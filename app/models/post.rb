class Post < ActiveRecord::Base
  # post status
  # 0 - ждет модерации
  # 1 - отклонено модератором
  # 2 - принято модератором

  default_scope { order('created_at desc') }
  scope :accepted_posts, -> { where('moderation = ?', 2) }

  acts_as_taggable

  belongs_to :user
  belongs_to :admin
  belongs_to :category

  attr_accessible :full, :intro, :title, :category_id, :tag_list, :moderation

  validates_presence_of :title, :intro, :full, :category_id

  def moderation_name number_mod
    case number_mod
      when 0 then 'На рассмотрении'
      when 1 then 'Отклонена'
      when 2 then 'Одобрена'
    end
  end
end
