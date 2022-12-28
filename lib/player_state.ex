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
    Agent.update(@name, fn [x, y] ->
      if Map.get(SampleLevel.level(), {x, y - 1}) |> Game.Fields.can_move?() do
        [x, y - 1]
      else
        [x, y]
      end
    end)
  end

  def move_down() do
    Agent.update(@name, fn [x, y] ->
      if Map.get(SampleLevel.level(), {x, y + 1}) |> Game.Fields.can_move?() do
        [x, y + 1]
      else
        [x, y]
      end
    end)
  end

  def move_left() do
    Agent.update(@name, fn [x, y] ->
      if Map.get(SampleLevel.level(), {x - 1, y}) |> Game.Fields.can_move?() do
        [x - 1, y]
      else
        [x, y]
      end
    end)
  end

  def move_right() do
    Agent.update(@name, fn [x, y] ->
      if Map.get(SampleLevel.level(), {x + 1, y}) |> Game.Fields.can_move?() do
        [x + 1, y]
      else
        [x, y]
      end
    end)
  end
end
