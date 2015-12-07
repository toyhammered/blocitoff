module ItemsHelper
  def time_remaining(task)
    distance_of_time_in_words(task.created_at - 7.days, Time.now)
  end
end
