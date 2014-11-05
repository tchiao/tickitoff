set :environment, "production"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

every 3.hours do
  rake "delete_tasks"
end