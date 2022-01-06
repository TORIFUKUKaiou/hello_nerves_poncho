defmodule HelloNervesPonchoSlackBandit.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: HelloNervesPonchoSlackBandit.Worker.start_link(arg)
      # {HelloNervesPonchoSlackBandit.Worker, arg}
      {Bandit, plug: HelloNervesPonchoSlackBandit.MyPlug, scheme: :http, options: [port: 4001]},
      {AHT20, bus_name: "i2c-1", name: AHT20}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloNervesPonchoSlackBandit.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
