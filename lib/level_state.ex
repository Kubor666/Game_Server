defmodule LevelState do
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> SampleLevel.level() end, name: __MODULE__)
    |> IO.inspect()
  end

  def get_level() do
    Agent.get(__MODULE__, fn all -> all end)
  end
end
