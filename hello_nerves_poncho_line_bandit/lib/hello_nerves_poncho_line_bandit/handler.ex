defmodule HelloNervesPonchoLineBandit.Handler do
  def handle_events(events) do
    events
    |> Enum.filter(fn event ->
      Map.get(event, "type") == "message"
    end)
    |> Enum.filter(fn event ->
      Map.get(event, "message")
      |> Map.get("type")
      |> Kernel.==("text")
    end)
    |> Enum.map(fn %{"message" => %{"text" => text}, "replyToken" => replyToken} ->
      {text, replyToken}
    end)
    |> Enum.each(fn {text, replyToken} ->
      HelloNervesPonchoLineBandit.Line.Api.reply(text, replyToken)
    end)
  end
end
