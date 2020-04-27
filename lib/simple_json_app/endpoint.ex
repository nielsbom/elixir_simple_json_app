defmodule SimpleJsonApp.EndPoint do
  use Plug.Router
  require Logger

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)

  forward("/foo", to: SimpleJsonApp.Router)

  match _ do
    Logger.info("Got bad request")
    send_resp(conn, 404, "Requested page not found, yo")
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts) do
    with {:ok, port} <- Application.fetch_env(:simple_json_app, :port) do
      Logger.info("Starting server at http://localhost:#{port}/")
      Plug.Cowboy.http(__MODULE__, [], port: port)
    end
  end
end
