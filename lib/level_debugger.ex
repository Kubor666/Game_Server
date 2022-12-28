defmodule Game.LevelDebugger do
  def debug(level, [player_x, player_y] = _player) do
    sorted =
      Enum.sort(level, fn {{x1, y1}, _arg1}, {{x2, y2}, _arg2} ->
        if y1 == y2 do
          x1 <= x2
        else
          y1 <= y2
        end
      end)

    Enum.reduce(sorted, nil, fn
      {{x, y}, val} = curr, nil ->
        if x == player_x and y == player_y do
          IO.write("*")
        else
          print(val)
        end

        curr

      {{x, y}, val} = curr, {{_, y}, _} ->
        if x == player_x and y == player_y do
          IO.write("*")
        else
          print(val)
        end

        curr

      {{_, y}, val} = curr, {{_, other_y}, _} ->
        IO.write("\n")
        print(val)
        curr
    end)

    :ok
  end

  defp print(:floor), do: IO.write(" ")
  defp print(:wall), do: IO.write("X")
end
