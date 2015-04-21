module TaskCommands
  class Create < ROM::Commands::Create[:sql]
    relation :tasks
    register_as :create
    result :one

    # define a validator to use
    # validator TaskValidator
  end
end
