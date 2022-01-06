defmodule HelloNervesPonchoSlackBandit.Slack.Api do
  def post_message(json) do
    # https://api.slack.com/methods/chat.postMessage
    url = "https://slack.com/api/chat.postMessage"

    headers = [
      "Content-type": "application/json",
      Authorization: "Bearer #{slack_bot_token()}"
    ]

    {:ok, _response} = HTTPoison.post(url, json, headers)
  end

  defp slack_bot_token do
    Application.get_env(:hello_nerves_poncho_slack_bandit, :slack_bot_token)
  end
end
