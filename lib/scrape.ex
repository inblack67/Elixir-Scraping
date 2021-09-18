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
      iex> Scrape.fetch "https://elixir-lang.org"
      {
      :ok,
      %Scrape.Structs{
        scraped_data: %{
          assets: [
            "/images/logo/logo.png",
            "https://spawnfest.org/img/nav_title.png",
            "/images/logo/eef.png"
          ],
          links: [
            "/",
            "/",
            "/install.html",
            "/learning.html",
            "/getting-started/introduction.html",
            "/cases.html",
            "/docs.html",
            "/development.html",
            "/blog/",
            "/getting-started/introduction.html",
            "/learning.html",
            "/cases.html",
            "/blog/2021/07/29/bootstraping-a-multiplayer-server-with-elixir-at-x-plane/",
            "/blog/2021/06/02/social-virtual-spaces-with-elixir-at-mozilla/",
            "/blog/2021/04/02/marketing-and-sales-intelligence-with-elixir-at-pepsico/",
            "/blog/2021/02/03/social-messaging-with-elixir-at-community/",
            "/blog/2021/01/13/orchestrating-computer-vision-with-elixir-at-v7/",
            "/blog/2020/12/10/integrating-travel-with-elixir-at-duffel/",
            "/blog/2020/11/17/real-time-collaboration-with-elixir-at-slab/",
            "/blog/2020/10/27/delivering-social-change-with-elixir-at-change.org/",
            "/blog/2020/10/08/real-time-communication-at-scale-with-elixir-at-discord/",
            "/blog/2020/09/24/paas-with-elixir-at-Heroku/",
            "/blog/2020/08/20/embedded-elixir-at-farmbot/",
            "https://hexdocs.pm/ex_unit/",
            "https://hexdocs.pm/mix/",
            "https://hex.pm/",
            "https://hexdocs.pm/",
            "https://hexdocs.pm/iex/",
            "https://www.heroku.com",
            "https://www.whatsapp.com",
            "https://klarna.com",
            "/getting-started/introduction.html",
            "/docs.html",
            "/crash-course.html",
            "/blog/2021/05/19/elixir-v1-12-0-released/",
            "https://github.com/elixir-lang/elixir",
            "irc://irc.libera.chat/elixir",
            "https://twitter.com/elixirlang",
            "https://cult.honeypot.io/originals/elixir-the-documentary",
            "https://spawnfest.org/",
            "https://hex.pm",
            "http://elixirforum.com",
            "https://elixir-slackin.herokuapp.com/",
            "https://discord.gg/elixir",
            "http://elixir.meetup.com",
            "https://github.com/elixir-lang/elixir/wiki",
            "https://erlef.org/",
            "/trademarks"
          ]
        }
      }}
  """
  def fetch(url) do
    task = Task.async(__MODULE__, :fetch_url, [url])

    task_res = Task.await(task)

    case task_res do
      {:ok, res} ->
        with %HTTPoison.Response{status_code: 200, body: body} <- res do
          parseRes = body |> Floki.parse_document()
          scrape_response(parseRes)
        else
          %HTTPoison.Response{status_code: 404} ->
            {:ok, 404}

          _ ->
            {:error, 500}
        end

      # case res do
      #   %HTTPoison.Response{status_code: 200, body: body} ->
      #     parseRes = body |> Floki.parse_document()

      #     scrape_response(parseRes)

      #   %HTTPoison.Response{status_code: 404} ->
      #     {:ok, 404}

      #   _ ->
      #     {:error, 500}
      # end

      {:error, error} ->
        {:error, error}

      _ ->
        {:error, 500}
    end
  end

  @doc false
  def fetch_url(url) do
    res = HTTPoison.get(url)
    res
  end

  defp scrape_response({:ok, html}) do
    imageUrls =
      html
      |> Floki.find("img")
      |> Floki.attribute("src")

    linkUrls =
      html
      |> Floki.find("a")
      |> Floki.attribute("href")

    {:ok, %Scrape.Structs{scraped_data: %{assets: imageUrls, links: linkUrls}}}
  end

  defp scrape_response({:error, error}) do
    {:error, error}
  end
end
