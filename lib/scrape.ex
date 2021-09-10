defmodule Scrape do
  def hello, do: {:ok, "worlds"}

  def fetch(url) do
    res = HTTPoison.get(url)

    case res do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        imageUrls =
          body
          |> Floki.find("img")
          |> Floki.attribute("src")

        linkUrls =
          body
          |> Floki.find("a")
          |> Floki.attribute("href")

        {:ok, %{assets: imageUrls, links: linkUrls}}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:ok, 404}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}

      true ->
        {:error, 500}
    end
  end
end
