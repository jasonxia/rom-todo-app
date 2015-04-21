class NewTaskForm < TaskForm
  commands tasks: :create

  def commit!
    tasks.try { tasks.create.call(attributes) }
  end
end
