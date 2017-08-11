defmodule DarkstoneWeb.Router do
  use DarkstoneWeb.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", DarkstoneWeb do
    pipe_through :browser # Use the default browser stack

    get "/", CharacterController, :index
    get "/characters/new", CharacterController, :new
    get "/characters/details/:id", CharacterController, :details
    post "/characters/create", CharacterController, :create
    get "/characters/:id/edit", CharacterController, :edit
    put "/characters/:id", CharacterController, :update
    delete "/characters/:id", CharacterController, :delete
  end

  scope "/", DarkstoneWeb do
    pipe_through :protected
    # Add protected routes below
  end

  # Other scopes may use custom stacks.
  # scope "/api", Darkstone do
  #   pipe_through :api
  # end
end
