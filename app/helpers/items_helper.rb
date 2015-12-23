module ItemsHelper
  def time_remaining(task, filter)
    if filter == 'completed'
      "Completed"
    else
      distance_of_time_in_words(7.days.ago, task.created_at.to_time)
    end
  end

  def completed_status(item, user, filter)
    if filter == 'completed'
      item.completed_at.strftime('%m/%d/%y')
    elsif filter == 'expired'
      link_to "Try Again", user_item_path(user, item, attribute: :created_at ), method: :put
    else
      link_to "", user_item_path(user, item, attribute: :completed_at), method: :put, class: 'fa fa-2x fa-square-o'
    end
  end

end
