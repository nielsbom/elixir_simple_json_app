defmodule WhosTheMan.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    # IO.inspect(conn)
    IO.inspect(conn.params)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(message()))
  end

  defp message do
    %{
      foo: "bar"
    }
  end
end
