import Config
config :whos_the_man, :port, (System.fetch_env!("PORT") || "4000") |> String.to_integer()
