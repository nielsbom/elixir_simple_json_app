use Mix.Config

config :whos_the_man, WhosTheMan.EndPoint,
  port: (System.get_env("PORT") || "4000") |> String.to_integer()
