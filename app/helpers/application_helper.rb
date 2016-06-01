module ApplicationHelper
  def human_date(date)
    date.blank? ? '' : date.strftime('%d/%m/%Y %m:%H')
  end
end
