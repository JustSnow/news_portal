module ActiveAdmin::ViewsHelper
  def moderation_name number_mod 
    case number_mod
      when 0 then 'На рассмотрении'
      when 1 then 'Отклонено'
      when 2 then 'Одобрено'
    end
  end 
end 