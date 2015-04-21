module TaskCommands
  class Update < ROM::Commands::Update[:sql]
    relation :tasks
    register_as :update
    result :one

    # define a validator to use
    # validator TaskValidator
  end
end
