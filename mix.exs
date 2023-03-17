defmodule TrailingSlashPlug.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :trailing_slash_plug,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
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
      {:plug, "~> 1.14"}
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
