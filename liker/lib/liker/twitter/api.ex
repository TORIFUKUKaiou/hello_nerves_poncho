defmodule Liker.Twitter.Api do
  @query "#大晦日ハッカソン -RT"
  @ignores []

  def search(last_created_at \\ 0) do
    response =
      ExTwitter.search(
        @query,
        count: 100,
        search_metadata: true
      )

    response.statuses
    |> statuses(last_created_at)
    |> do_search_next_page(response.metadata, last_created_at, [])
  end

  def create_favorite(id) do
    try do
      ExTwitter.create_favorite(id, [])
    rescue
      [ExTwitter.Error] -> IO.puts("You have already favorited this status.")
    end
  end

  defp do_search_next_page([], _metadata, _last_created_at, result_list), do: result_list

  defp do_search_next_page(prev_page_list, metadata, last_created_at, result_list) do
    response = ExTwitter.search_next_page(metadata)

    response.statuses
    |> statuses(last_created_at)
    |> do_search_next_page(response.metadata, last_created_at, result_list ++ prev_page_list)
  end

  defp statuses(statuses, last_created_at) do
    statuses
    |> Enum.map(fn %{
                     id: id,
                     id_str: id_str,
                     text: text,
                     created_at: created_at,
                     user: %{
                       profile_image_url_https: profile_image_url_https,
                       screen_name: screen_name
                     },
                     favorited: favorited
                   } ->
      %{
        id: id,
        id_str: id_str,
        text: text,
        created_at:
          Timex.parse!(created_at, "{WDshort} {Mshort} {D} {h24}:{m}:{s} +0000 {YYYY}")
          |> Timex.to_unix(),
        profile_image_url_https: profile_image_url_https,
        screen_name: screen_name,
        url: "https://twitter.com/#{screen_name}/status/#{id_str}",
        favorited: favorited
      }
    end)
    |> Enum.reject(fn %{screen_name: screen_name} -> screen_name in @ignores end)
    |> Enum.reject(fn %{favorited: favorited} -> favorited end)
    |> Enum.filter(fn %{created_at: created_at} -> created_at > last_created_at end)
  end
end
