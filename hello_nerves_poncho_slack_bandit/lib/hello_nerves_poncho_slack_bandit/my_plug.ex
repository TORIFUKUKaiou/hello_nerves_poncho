defmodule HelloNervesPonchoSlackBandit.MyPlug do
  import Plug.Conn

  def init(options) do
    # initialize options
    options
  end

  def call(conn, opts) do
    {:ok, body, _conn} = Plug.Conn.read_body(conn, opts)

    if HelloNervesPonchoSlackBandit.Slack.verify(conn, body) do
      body
      |> URI.decode_query()
      |> do_something()

      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(%{}))
    end
  end

  defp do_something(query) do
    spawn(fn -> HelloNervesPonchoSlackBandit.Handler.handle_command(query) end)
  end
end
