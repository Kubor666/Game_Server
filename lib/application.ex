defmodule Game.Application do

  def start(_type, _args) do

    children = [
      {Task.Supervisor, name: Level.TaskSupervisor},
      LevelState
    ]
    opts = [strategy: :one_for_one, name: Level.Supervisor]
    Supervisor.start_link(children, opts)

  end
end
