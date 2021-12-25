defmodule HelloNervesPonchoLineBandit.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: HelloNervesPonchoLineBandit.Worker.start_link(arg)
      # {HelloNervesPonchoLineBandit.Worker, arg}
      {Bandit, plug: HelloNervesPonchoLineBandit.MyPlug, scheme: :http, options: [port: 4000]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloNervesPonchoLineBandit.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
