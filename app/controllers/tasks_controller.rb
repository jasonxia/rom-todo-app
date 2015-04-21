class TasksController < ApplicationController
  def index
    render locals: {
      tasks: tasks.index_view(params[:status]).as(:tasks)
    }
  end

  def new
    render :new, locals: { task: NewTaskForm.build }
  end

  def create
    task_form = NewTaskForm.build(params[:task]).save

    if task_form.success?
      redirect_to :tasks
    else
      render :new, locals: { task: task_form }
    end
  end

  def edit
    task_form = UpdateTaskForm.build({}, { id: params[:id] })

    render :edit, locals: { task: task_form }
  end

  def update
    task_form = UpdateTaskForm.build(params[:user], id: params[:id]).save

    if task_form.success?
      redirect_to :tasks
    else
      render :edit, locals: { task: task_form }
    end
  end

  def delete
    tasks_command.try do
      tasks_command.delete.by_id(params[:id])
    end
  end

  private

  def tasks
    rom.relation(:tasks)
  end

  def tasks_command
    rom.commands(:tasks)
  end
end
