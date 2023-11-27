defmodule Geobuf.MixProject do
  use Mix.Project

  def project do
    [
      app: :geobuf,
      version: "0.1.2",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.4"},
      {:protobuf, "~> 0.10.0"},
      {:google_protos, "~> 0.1"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp description() do
    "Elixir implementation of the Geobuf format. Geobuf is a compact binary encoding for geographic data. It is based on protobuf, but optimized for encoding geographic data. It is has 1to1 compatibility with GeoJSON."
  end

  defp package do
    %{
      licenses: ["MIT"],
      maintainers: ["mscno"],
      links: %{"GitHub" => "https://github.com/paraplyventures/geobuf-ex"}
    }
  end
end
