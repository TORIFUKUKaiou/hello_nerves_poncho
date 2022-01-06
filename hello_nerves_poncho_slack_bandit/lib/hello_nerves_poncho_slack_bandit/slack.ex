defmodule HelloNervesPonchoSlackBandit.Slack do
  # https://api.slack.com/authentication/verifying-requests-from-slack
  def verify(conn, request_body) do
    timestamp =
      conn.req_headers
      |> Enum.find(fn {key, _} -> key == "x-slack-request-timestamp" end)
      |> elem(1)
      |> String.to_integer()

    slack_signature =
      conn.req_headers
      |> Enum.find(fn {key, _} -> key == "x-slack-signature" end)
      |> elem(1)

    validate_request(timestamp, request_body, slack_signature)
  end

  defp validate_request(timestamp, request_body, slack_signature) do
    DateTime.diff(DateTime.now!("Etc/UTC"), DateTime.from_unix!(timestamp))
    |> validate_request(timestamp, request_body, slack_signature)
  end

  defp validate_request(diff, _timestamp, _request_body, _slack_signature)
       when abs(diff) > 5 * 60 do
    false
  end

  defp validate_request(_diff, timestamp, request_body, slack_signature) do
    sig_basestring = "v0:" <> Integer.to_string(timestamp) <> ":" <> request_body

    my_signature =
      :crypto.mac(:hmac, :sha256, slack_signing_secret(), sig_basestring)
      |> Base.encode16()
      |> String.downcase()

    my_signature = "v0=" <> my_signature

    my_signature == slack_signature
  end

  defp slack_signing_secret do
    Application.get_env(:hello_nerves_poncho_slack_bandit, :slack_signing_secret)
  end
end
