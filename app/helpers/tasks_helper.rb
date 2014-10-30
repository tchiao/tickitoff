module TasksHelper

  def countdown(time)
    return 7 - ((Time.now - time.to_time) / 86400.0).ceil
  end

end
