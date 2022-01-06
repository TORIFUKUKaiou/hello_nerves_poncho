import Config

config :hello_nerves_poncho_slack_bandit,
  slack_signing_secret: System.get_env("SLACK_SIGNING_SECRET"),
  slack_bot_token: System.get_env("SLACK_BOT_TOKEN")
