import Config

config :hello_nerves_poncho_line_bandit,
  channel_secret: System.get_env("LINE_CHANNEL_SECRET"),
  channel_access_token: System.get_env("LINE_CHANNEL_ACCESS_TOKEN")
