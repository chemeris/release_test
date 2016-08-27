defmodule ReleaseTest.Mixfile do
  use Mix.Project

  def project do
    [app: :release_test,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:lager,
                    :exometer_core,
      :edown,
      :exometer_lager,
      :meck,
      :parse_trans,
      ]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:exometer_core, github: "Feuerlabs/exometer_core",
                       branch: "master",
                       override: :true},
      {:exometer_lager, github: "fairwaves/exometer_lager"},
      {:distillery, "~> 0.9"},

      {:lager, ">= 2.2.3", override: :true},

      # Override dependency to resolve conflicts exometer_core with folsom
      {:meck, github: "eproxus/meck", tag: "0.8.2", override: :true},
      # Override dependency to resolve conflicts setup with parse_trans
      {:edown, github: "uwiger/edown", override: :true},
    ]
  end

end
