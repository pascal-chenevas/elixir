defmodule Hangman.Application do

  use Application
  use DynamicSupervisor

  def start(_type, _args) do
    children = [
           {DynamicSupervisor, strategy: :one_for_one, name: Hangman.Server}
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
  
  def init(init_arg) do
    DynamicSupervisor.init(
      strategy: :one_for_one,
      extra_arguments: [init_arg]
    )
  end
end
