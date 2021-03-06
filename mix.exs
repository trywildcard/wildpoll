defmodule WildPoll.Mixfile do
  use Mix.Project

  def project do
    [app: :wild_poll,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {WildPoll, []},
     applications: [:phoenix, :cowboy, :logger, :httpoison]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [
      {:phoenix, "~> 0.11"},
      {:phoenix_live_reload, "~> 0.3"},
      {:cowboy, "~> 1.0"},
      {:poison, "~> 1.4"},
      {:httpoison, "~> 0.6"}
    ]
  end
end
