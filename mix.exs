defmodule BettyGql.MixProject do
  use Mix.Project

  def project do
    [
      app: :betty_gql,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      version: "0.2.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      description: description(),
      name: "Betty GQL",
      source_url: "https://github.com/JoeriDijkstra/betty_gql"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      files: ~w(lib .formatter.exs mix.exs README*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/JoeriDijkstra/betty_gql"}
    ]
  end

  defp description do
    "This module was made as a wrapper for the data api used in Betty Blocks. This package aims to allow you to make a graphql request using a single function."
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.1"},
      {:neuron, "~> 5.0.0"},
      {:ex_doc, "~> 0.28.4"}
    ]
  end
end
