defmodule Game.LevelDebugger do
  def debug(level) do
    sorted =
    Enum.sort(level, fn {{x1, y1}, _chuj}, {{x2, y2}, _pizda} ->
      if y1 == y2 do
        x1 <= x2
      else
        y1 <= y2
      end
    end)
    |> IO.inspect

    Enum.reduce(sorted, nil, fn
      {_, val} = curr, nil ->
        print(val)
        curr
      {{_, y}, val} = curr, {{_, y}, _} ->
        print(val)
        curr
      {{_, y}, val} = curr, {{_, other_y}, _} ->
        IO.write("\n")
        print(val)
        curr
    end)
    :ok
  end

  defp print(:floor), do: IO.write "  "
  defp print(:wall), do: IO.write  "X"
end
