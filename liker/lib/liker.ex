defmodule Liker do
  @moduledoc """
  Documentation for `Liker`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Liker.hello()
      :world

  """
  def hello do
    :world
  end

  def run do
    statuses =
      last_created_at()
      |> Liker.Twitter.Api.search()
      |> IO.inspect()

    statuses
    |> Enum.map(fn %{id: id} ->
      Liker.Twitter.Api.create_favorite(id)
    end)

    update_created_at(statuses)
  end

  defp last_created_at do
    %{created_at: created_at} = Liker.CreatedAtAgent.get()

    created_at
  end

  defp update_created_at([]), do: nil

  defp update_created_at(statuses) do
    statuses
    |> Enum.map(fn %{created_at: created_at} -> created_at end)
    |> Enum.max()
    |> Liker.CreatedAtAgent.update()
  end
end
