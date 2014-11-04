set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

every 6.hours do
  rake "delete_tasks"
end