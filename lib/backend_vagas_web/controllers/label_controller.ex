defmodule BackendVagasWeb.LabelController do
  use BackendVagasWeb, :controller

  def index(conn, params) do
    case(HTTPoison.get("https://api.github.com/repos/backend-br/vagas/labels")) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        labels = Poison.decode!(body) |>
                  Enum.map(fn label -> label["name"] end)
        conn
        |> json(labels)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        con
        |> json(%{response: "Not Found"})
      {:error, %HTTPoison.Error{reason: reason}} ->
        con
        |> json(%{reason: reason})
    end
  end
end
