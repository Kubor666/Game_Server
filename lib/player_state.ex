defmodule Game.Player.Worker do
  use Agent

  @name __MODULE__

  def start_link(_opts) do
    Agent.start_link(fn -> Game.Player.current_position() end, name: @name)
    |> IO.inspect()
  end

  def get_player_position() do
    Agent.get(@name, fn all -> all end)
  end

  def move_up() do
    Agent.update(@name, fn [x, y] -> [x, y - 1] end)
  end

  def move_down() do
    Agent.update(@name, fn [x, y] -> [x, y + 1] end)
  end

  def move_left() do
    Agent.update(@name, fn [x, y] -> [x - 1, y] end)
  end

  def move_right() do
    Agent.update(@name, fn [x, y] -> [x + 1, y] end)
  end
end
