defmodule WhosTheMan.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    # IO.puts("Starting from WhosTheMan.Application")
    # IO.puts("The port is:...")
    # IO.puts(Application.fetch_env(:whos_the_man, __MODULE__))

    children = [
      # Starts a worker by calling: WhosTheMan.Worker.start_link(arg)
      # {WhosTheMan.Worker, arg}
      WhosTheMan.EndPoint
    ]

    Logger.info("Starting application..")
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WhosTheMan.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
