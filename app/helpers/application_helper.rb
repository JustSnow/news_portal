module ApplicationHelper
  def moderation_name number_mod
    case number_mod
      when 0 then 'На рассмотрении'
      when 1 then 'Отклонена'
      when 2 then 'Одобрена'
    end
  end
end
