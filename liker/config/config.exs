import Config

config :extwitter, :oauth,
  consumer_key: System.get_env("STSP_TWITTER_CONSUMER_KEY"),
  consumer_secret: System.get_env("STSP_TWITTER_CONSUMER_SECRET"),
  access_token: System.get_env("STSP_TWITTER_ACCESS_TOKEN"),
  access_token_secret: System.get_env("STSP_TWITTER_ACCESS_TOKEN_SECRET")

config :liker, Liker.Scheduler,
  jobs: [
    # Every 5 minutes
    {"*/5 * * * *", {Liker, :run, []}}
  ]
