module ItemsHelper
  def time_remaining(task)
    distance_of_time_in_words(7.days.ago, task.created_at.to_time)
  end
end
