defmodule TrailingSlashPlug.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :trailing_slash_plug,
      version: @version,
      description: "A plug to remove the trailing slash",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.html": :test,
        "coveralls.json": :test,
        "coveralls.post": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:excoveralls, "~> 0.15", only: :test},
      {:plug, "~> 1.14"},
      {:sobelow, "~> 0.11", only: [:test, :dev], runtime: false}
    ]
  end

  defp package do
    [
      files: [
        "lib/**/*.ex",
        "mix.exs",
        "README.md",
        "LICENSE"
      ],
      maintainers: ["Martide"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/martide/trailing_slash"
      }
    ]
  end
end
