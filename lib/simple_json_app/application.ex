defmodule SimpleJsonApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    # IO.puts("Starting from SimpleJsonApp.Application")
    # IO.puts("The port is:...")
    # IO.puts(Application.fetch_env(:simple_json_app, __MODULE__))

    children = [
      # Starts a worker by calling: SimpleJsonApp.Worker.start_link(arg)
      # {SimpleJsonApp.Worker, arg}
      SimpleJsonApp.EndPoint
    ]

    Logger.info("Starting application..")
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleJsonApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
