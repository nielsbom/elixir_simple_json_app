use Mix.Config

config :whos_the_man, WhosTheMan.EndPoint,
  port: (System.get_env("PORT") || "4444") |> String.to_integer()
