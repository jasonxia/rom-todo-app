class TaskMapper < ROM::Mapper
  relation :tasks

  model Task

  attribute :id
  attribute :title
  attribute :is_completed
end
