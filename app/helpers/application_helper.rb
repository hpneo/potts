module ApplicationHelper

  def status_label(status)
    case status
      when 'accepted'
        'success'
      when 'started'
        'started'
      when 'finished'
        'finished'
      when 'rejected'
        'important'
      when 'unscheduled'
        ''
      when 'unstarted'
        'warning'
      when 'delivered'
        'notice'
    end
  end

end
