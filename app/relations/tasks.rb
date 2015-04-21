class TasksRelation < ROM::Relation[:sql]
  dataset :tasks

  def by_id(id)
    where(id: id)
  end

  def index_view(status)
    case status
    when 'active'
      active
    when 'completed'
      completed
    else
      self
    end
  end

  def active
    where(is_completed: true)
  end

  def completed
    where(is_completed: false)
  end
end
