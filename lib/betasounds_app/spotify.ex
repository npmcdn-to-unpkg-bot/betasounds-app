defmodule Spotify do
  use HTTPotion.Base

  def process_url(url) do
    "https://api.spotify.com/v1/" <> url
  end

  def process_request_headers(headers) do
    Keyword.put(headers, :"User-Agent", "betasounds")
  end

  def process_response_body(body) do
    body
      |> IO.iodata_to_binary
      |> Poison.decode!(keys: :atoms)
  end
end
