defmodule Liker.MixProject do
  use Mix.Project

  def project do
    [
      app: :liker,
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
      mod: {Liker.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:oauther, "~> 1.3"},
      {:jason, "~> 1.3"},
      {:extwitter, "~> 0.13.0"},
      {:quantum, "~> 3.4"}
    ]
  end
end
