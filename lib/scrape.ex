defmodule Scrape do
  @moduledoc """
    Provides a function `fetch/1` to scrape the web
  """

  @doc """
  fetches the page corresponding to the `url` and returns an object that has the following attributes:
  - `assets` - an array of urls present in the `<img>` tags on the page
  - `links` - an array of urls present in the `<a>` tags on the page

  ## Parameters

    - url: String that represents the url of the website, which needs to be scraped

  ## Example
      iex(2)> Scrape.fetch "https://elixir-lang.org/docs.html"
      {:ok,
      %{
      assets: ["/images/logo/logo.png", "https://spawnfest.org/img/nav_title.png",
        "/images/logo/eef.png", ...],
      links: ["/", "/", "/install.html", "/learning.html",
        "/getting-started/introduction.html", "/cases.html", "/docs.html",
        "/development.html", "/blog/", ...]
      }}
  """
  def fetch(url) do
    res = HTTPoison.get(url)

    case res do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        parseRes = body |> Floki.parse_document()

        case parseRes do
          {:ok, html} ->
            imageUrls =
              html
              |> Floki.find("img")
              |> Floki.attribute("src")

            linkUrls =
              html
              |> Floki.find("a")
              |> Floki.attribute("href")

            {:ok, %{assets: imageUrls, links: linkUrls}}

          {:error, reason} ->
            {:error, reason}
        end

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:ok, 404}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}

      true ->
        {:error, 500}
    end
  end
end
