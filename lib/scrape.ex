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
      iex> Scrape.fetch "https://inblack67.vercel.app"
      {:ok,
      %{
      assets: ["./icons/phoex.png", "./icons/github.svg", "./icons/youtube.svg",
        "./icons/typescript.svg", "./icons/js.svg", "./icons/nodejs.svg",
        "./icons/reactjs.svg", "./icons/flutter.svg", "./icons/elixir.svg",
        "./icons/phoex.png", "./icons/graphql.svg", "./icons/postgresql.svg",
        "./icons/redis.svg", "./icons/mongodb.svg", "./icons/docker.svg",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/elixir-gql.png?alt=media&token=df9886e1-4e21-4863-a5a1-aa5852a54dae",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/96213165-909E-40A2-B6FC-DBAA6C1CDAD2_1_105_c.jpeg?alt=media&token=2e90b1f4-c6c5-4dd2-80f4-a18a96d2e4e0",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/gographql.png?alt=media&token=d3dd2157-a508-4e53-bf87-e5ab8254c906",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/gorest.png?alt=media&token=a80510cc-ac49-4bc5-a20d-0c636335a1b3",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/heathens.png?alt=media&token=c693ffb4-7180-4f00-8593-f6e572c57e7b",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/tsreddit.png?alt=media&token=95964ed6-d4db-4c8e-89ea-d408e6661721",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/realtime.png?alt=media&token=c9122487-d15c-4c1b-b35f-e9ad0096eedf",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/Screenshot%202020-09-08%20at%2012.23.37%20PM.png?alt=media&token=ebb47182-a2cf-499c-b409-b3af09996d0d",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/flick.png?alt=media&token=bf0af625-a9ad-4231-90f5-55b88f340239",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/fire.png?alt=media&token=c5b6b77f-4e00-4709-ae6b-82dba81920c2",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/boot.png?alt=media&token=b80d792b-9c78-4cbd-a434-e76bd95ef21c",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/Screenshot%202020-08-25%20at%2010.41.05%20AM.png?alt=media&token=09bbdbd9-3641-4b41-957c-38e20c196216",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/keeper.png?alt=media&token=01898931-bfb4-4448-aeab-df8043f7e21d",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/ok.png?alt=media&token=b4ae3d94-ee97-46ee-8399-b7b2a2c1104d",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/Screenshot%202020-08-25%20at%2010.31.09%20AM.png?alt=media&token=7955e502-3b88-40da-b911-4570ed952430",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/Screenshot%202020-08-25%20at%2010.29.54%20AM.png?alt=media&token=16c1fac5-2e0e-440d-be1c-c7b5a5809962",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/Screenshot%202020-08-25%20at%2010.26.13%20AM.png?alt=media&token=240e4c26-e14e-453d-b30f-e86831a92131",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/Screenshot%202020-08-25%20at%2010.18.14%20AM.png?alt=media&token=68461d02-a55d-4777-baae-a7839fa8c398",
        "https://firebasestorage.googleapis.com/v0/b/portfolio-d074c.appspot.com/o/vaga.png?alt=media&token=de24be1b-6d60-4efc-b517-df17a1ef91fa"],
      links: ["/", "https://github.com/inblack67",
        "https://www.youtube.com/channel/UC8Pz6DKs7Kw-qCeJkS9D8iQ",
        "https://github.com/inblack67/FElixir",
        "https://github.com/inblack67/FElixir", "https://github.com/inblack67/Twix",
        "https://github.com/inblack67/Twix",
        "https://github.com/inblack67/GoLang-GQLGen-API",
        "https://github.com/inblack67/GoLang-GQLGen-API",
        "https://github.com/inblack67/GoLang-REST-API",
        "https://github.com/inblack67/GoLang-REST-API", "https://app.21heathens.tk",
        "https://app.21heathens.tk", "https://github.com/inblack67/Reddit-Clone",
        "https://github.com/inblack67/Reddit-Clone",
        "https://nextjs-realtime.herokuapp.com",
        "https://nextjs-realtime.herokuapp.com",
        "https://nextjs-static-site.netlify.app",
        "https://nextjs-static-site.netlify.app",
        "https://react-with-flickr.netlify.app",
        "https://react-with-flickr.netlify.app", "https://fire-gallery.netlify.app",
        "https://fire-gallery.netlify.app", "https://vast-peak-56244.herokuapp.com",
        "https://vast-peak-56244.herokuapp.com", "https://food-trucks.netlify.app",
        "https://food-trucks.netlify.app",
        "https://damp-escarpment-42938.herokuapp.com/login",
        "https://damp-escarpment-42938.herokuapp.com/login",
        "https://vigorous-pasteur-db1e01.netlify.app",
        "https://vigorous-pasteur-db1e01.netlify.app",
        "https://jsmonkeys.netlify.app", "https://jsmonkeys.netlify.app",
        "https://youthful-noether-387b57.netlify.app",
        "https://youthful-noether-387b57.netlify.app",
        "https://quiet-sea-07813.herokuapp.com",
        "https://quiet-sea-07813.herokuapp.com",
        "https://sleepy-heisenberg-c758b2.netlify.app",
        "https://sleepy-heisenberg-c758b2.netlify.app",
        "https://nostalgic-volhard-6b612e.netlify.app",
        "https://nostalgic-volhard-6b612e.netlify.app",
        "https://github.com/inblack67",
        "https://www.youtube.com/channel/UC8Pz6DKs7Kw-qCeJkS9D8iQ",
        "https://stackoverflow.com/users/12136900/aman-bhardwaj",
        "https://www.npmjs.com/~inblack67", "https://www.linkedin.com/in/inblack67"]
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
