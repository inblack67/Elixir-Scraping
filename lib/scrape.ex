defmodule Scrape do
  defstruct scraped_data: %{assets: [], links: []}

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
      iex> Scrape.fetch "https://elixir-lang.org"
      {
      :ok,
      %Scrape{
        scraped_data: %{
          assets: [
            "/images/logo/logo.png",
            "https://spawnfest.org/img/nav_title.png",
            "/images/logo/eef.png",
            ...
          ],
          links: [
            "https://hex.pm",
            "http://elixirforum.com",
            "https://elixir-slackin.herokuapp.com/",
            "https://discord.gg/elixir",
            "http://elixir.meetup.com",
            "https://github.com/elixir-lang/elixir/wiki",
            "https://erlef.org/",
            ...
          ]
        }
      }}
  """
  def fetch(url) do
    task = Task.async(__MODULE__, :fetch_url, [url])

    task_res = Task.await(task)

    with {:ok, res} <- task_res,
         %HTTPoison.Response{status_code: 200, body: body} <- res do
      body
      |> Floki.parse_document()
      |> scrape_response()
    else
      %HTTPoison.Response{status_code: 404} ->
        {:ok, 404}

      {:error, error} ->
        {:error, error}
    end
  end

  @doc false
  def fetch_url(url), do: HTTPoison.get(url)

  defp scrape_response({:ok, html}) do
    image_urls =
      html
      |> Floki.find("img")
      |> Floki.attribute("src")

    link_urls =
      html
      |> Floki.find("a")
      |> Floki.attribute("href")

    {:ok, %Scrape{scraped_data: %{assets: image_urls, links: link_urls}}}
  end

  defp scrape_response({:error, error}), do: {:error, error}
end
