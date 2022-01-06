# HelloNervesPoncho

**Run Line bot on Nerves🚀**

## Targets

Nerves applications produce images for hardware targets based on the
`MIX_TARGET` environment variable. If `MIX_TARGET` is unset, `mix` builds an
image that runs on the host (e.g., your laptop). This is useful for executing
logic tests, running utilities, and debugging. Other targets are represented by
a short name like `rpi3` that maps to a Nerves system image for that platform.
All of this logic is in the generated `mix.exs` and may be customized. For more
information about targets see:

https://hexdocs.pm/nerves/targets.html#content

## Getting Started

To start your Nerves app:
  * `export MIX_TARGET=my_target` or prefix every command with
    `MIX_TARGET=my_target`. For example, `MIX_TARGET=rpi3`
  * Set LINE environment variables
    * LINE_CHANNEL_SECRET
    * LINE_CHANNEL_ACCESS_TOKEN
  * Set Slack environment variables
    * SLACK_SIGNING_SECRET
    * SLACK_BOT_TOKEN
  * (Option) Set Wi-Fi config
    * NERVES_WIFI_SSID
    * NERVES_WIFI_PASSPHRASE
  * `cd hello_nerves_poncho_firmware`
  * Install dependencies with `mix deps.get`
  * Create firmware with `mix firmware`
  * Burn to an SD card with `mix firmware.burn`
  * `ngrok http <Nerves IP address>:4000` for LINE
  * `ngrok http <Nerves IP address>:4001` for Slack

## Learn more

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: https://nerves-project.org/
  * Forum: https://elixirforum.com/c/nerves-forum
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves
  * LINE Messaging API: https://developers.line.biz/en/docs/messaging-api/
  * Blog: https://qiita.com/torifukukaiou/items/8393fb3deb2448163b07
