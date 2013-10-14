class Post < ActiveRecord::Base
  # post status
  # 0 - ждет модерации
  # 1 - отклонено модератором
  # 2 - принято модератором

  default_scope { order('created_at desc') }
  scope :accepted_posts, -> { where('moderation = ?', 2) }
  scope :today_posts, -> { where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day) }

  acts_as_taggable
  acts_as_commentable

  belongs_to :user
  belongs_to :admin
  has_and_belongs_to_many :categories

  attr_accessible :full, :intro, :title, :category_ids, :tag_list, :moderation

  validates_presence_of :title, :intro, :full, :category_ids

  def moderation_name number_mod
    case number_mod
      when 0 then 'На рассмотрении'
      when 1 then 'Отклонена'
      when 2 then 'Одобрена'
    end
  end

  define_index do
    indexes full, title, intro
  end
end
