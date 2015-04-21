class TaskForm < ROM::Model::Form
  input do
    set_model_name 'Task'

    attribute :title, String
    attribute :is_completed, Axiom::Types::Boolean
  end

  validations do
    relation :tasks

    validates :title, presence: true
  end
end
