defmodule AbsintheDialyzerWarning.Mixfile do
  use Mix.Project

  def project do
    [
      app: :absinthe_dialyzer_warning,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      dialyzer: [plt_add_deps: :transitive],
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
      # {:absinthe, "~> 1.4"},
      {:absinthe, git: "git@github.com:bundacia/absinthe.git", branch: "fix_dialyzer_warning"},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false},
    ]
  end
end
