defmodule HelloNervesPonchoLineBandit.Line do
  # https://developers.line.biz/ja/reference/messaging-api/#signature-validation
  def verify(conn, body) do
    x_line_signature =
      conn.req_headers
      |> Enum.find(fn {key, _} -> key == "x-line-signature" end)
      |> elem(1)

    my_signature =
      :crypto.mac(:hmac, :sha256, channel_secret(), body)
      |> Base.encode64()

    my_signature == x_line_signature
  end

  defp channel_secret do
    Application.get_env(:hello_nerves_poncho_line_bandit, :channel_secret)
  end
end
