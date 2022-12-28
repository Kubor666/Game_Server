defmodule Game.Fields do

  def can_move?(:wall), do: false
  def can_move?(:floor), do: true
  def can_move?(nil), do: false
end
