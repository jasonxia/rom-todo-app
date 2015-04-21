class UpdateTaskForm < TaskForm
  commands tasks: :update

  def commit!
    tasks.try { tasks.update.by_id(id).set(attributes) }
  end
end
