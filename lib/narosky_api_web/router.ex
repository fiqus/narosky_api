defmodule NaroskyApiWeb.Router do
  use NaroskyApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug(NaroskyApi.Auth.Plug.CurrentUser)
  end

  pipeline :auth do
    plug(NaroskyApi.Auth.AuthAccessPipeline)
  end

  scope "/" do
    scope "/admin", NaroskyApiWeb do
      pipe_through :browser

      resources "/users", UserController, only: [:show, :new, :create]
      resources "/sessions", SessionController, only: [:new, :create, :delete]

      scope "/" do
        pipe_through :auth

        resources "/species", SpecieController
      end
    end

    scope "/api", NaroskyApiWeb do
      pipe_through :api

      get "/species", SpecieController, :get_json
      get "/quiz/:region", SpecieController, :quiz
    end

    # forward "/api", Absinthe.Plug,
    #   schema: NaroskyApiWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: NaroskyApiWeb.Schema,
      interface: :simple,
      context: %{pubsub: NaroskyApiWeb.Endpoint}
  end
end
