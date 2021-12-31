defmodule Liker.CreatedAtAgent do
  use Agent

  def start_link(_initial_value) do
    created_at = Timex.now() |> Timex.to_unix() |> Kernel.-(20000)
    Agent.start_link(fn -> %{created_at: created_at} end, name: __MODULE__)
  end

  def get, do: Agent.get(__MODULE__, & &1)

  def update(created_at) do
    Agent.update(__MODULE__, fn _ ->
      %{created_at: created_at}
    end)
  end
end
