defmodule Odin.Router do
  use Odin.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  pipeline :api_auth do
    plug :accepts, ["json", "json-api"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  scope "/api", Odin do
    pipe_through :api

    post "auth", SessionController, :create, as: :login
  end
end
