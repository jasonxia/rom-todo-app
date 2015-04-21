ValueObject = Virtus.value_object(coerce: false)

class Task
  include ValueObject

  values do
    attribute :id, Integer
    attribute :title, String
    attribute :is_completed, Axiom::Types::Boolean
  end

  def status
    if is_completed
      :completed
    else
      :active
    end
  end

  def status_label
    status.to_s.capitalize
  end
end
