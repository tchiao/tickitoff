module TasksHelper

  def countdown(time)
    days = 7 - ((Time.now - time.to_time) / 86400.0).round
    if days < 0
      return 0
    else
      return days
    end
  end

end
