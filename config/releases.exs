import Config
config :simple_json_app, :port, (System.fetch_env!("PORT") || "4000") |> String.to_integer()
