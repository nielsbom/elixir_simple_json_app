defmodule WhosTheMan.MixProject do
  use Mix.Project

  def project do
    [
      app: :whos_the_man,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {WhosTheMan.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~>4.0.1"},
      {:plug, "~>1.10.0"},
      {:plug_cowboy, "~>2.0"}
    ]
  end
end
