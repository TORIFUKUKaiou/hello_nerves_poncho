defmodule HelloNervesPonchoLineBandit.MixProject do
  use Mix.Project

  def project do
    [
      app: :hello_nerves_poncho_line_bandit,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {HelloNervesPonchoLineBandit.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:bandit, "~> 0.4.5"},
      {:plug_cowboy, "~> 2.5"},
      {:jason, "~> 1.3"},
      {:httpoison, "~> 1.8"}
    ]
  end
end
