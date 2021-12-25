defmodule HelloNervesPonchoLineBandit.MyPlug do
  import Plug.Conn

  def init(options) do
    # initialize options
    options
  end

  def call(conn, opts) do
    {:ok, body, _conn} = Plug.Conn.read_body(conn, opts)

    if HelloNervesPonchoLineBandit.Line.verify(conn, body) do
      Jason.decode!(body)
      |> Map.get("events")
      |> do_something()

      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(%{}))
    end
  end

  defp do_something(events) do
    spawn(fn -> HelloNervesPonchoLineBandit.Handler.handle_events(events) end)
  end
end
