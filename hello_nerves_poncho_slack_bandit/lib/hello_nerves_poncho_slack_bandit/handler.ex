defmodule HelloNervesPonchoSlackBandit.Handler do
  def handle_command(query) do
    do_handle_command(query["command"], query)
  end

  defp do_handle_command("/hello", query) do
    channel_id = query["channel_id"]
    user_id = query["user_id"]
    say(channel_id, "Hey there <@#{user_id}>")
  end

  defp do_handle_command("/aht20-awesome", query) do
    channel_id = query["channel_id"]
    user_id = query["user_id"]
    {:error, {:already_started, pid}} = AHT20.start_link(bus_name: "i2c-1", name: AHT20)

    {:ok, %AHT20.Measurement{temperature_c: temperature_c, humidity_rh: humidity_rh}} =
      AHT20.measure(pid)

    say(channel_id, "<@#{user_id}> 温度は#{temperature_c}℃、湿度は#{humidity_rh}%だぜ〜")
  end

  defp say(channel, text) do
    %{
      channel: channel,
      text: text,
      link_names: true,
      username: "awesome-bot",
      icon_url: "https://ca.slack-edge.com/TL799TXED-UL27SRN3V-ffb245030052-512"
    }
    |> Jason.encode!()
    |> HelloNervesPonchoSlackBandit.Slack.Api.post_message()
  end
end
