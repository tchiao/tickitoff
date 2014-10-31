desc "Removes any tasks that were created 7 days ago"
task delete_tasks: :environment do
  Task.where("created_at <= ?", Time.now - 7.days).destroy_all
  # tasks = Task.where("created_at >= ?", 7.days.ago).destroy_all
end