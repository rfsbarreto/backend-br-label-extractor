defmodule BackendVagasWeb.Router do
  use BackendVagasWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BackendVagasWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", BackendVagasWeb do
    pipe_through :api

    get "/labels", LabelController, :index
    get "/issues", IssueController, :index
    get "/issues/:id/labels", IssueController, :labels
    post "/issues", IssueController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", BackendVagasWeb do
  #   pipe_through :api
  # end
end
