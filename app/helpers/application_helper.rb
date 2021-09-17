module ApplicationHelper
  def full_title page_title = ""
    base_title = t "title_page"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end

  def parse_time time
    DateTime.parse(time).strftime(Settings.format_time)
  end

  def time_current
    Time.current.strftime(Settings.format_time)
  end

  def room room_id
    @room = Room.find_by(id: room_id)
  end
end
