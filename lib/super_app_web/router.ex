defmodule SuperAppWeb.Router do
  use SuperAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SuperAppWeb do
    pipe_through :api

    get "/", PageController, :index

    resources "/users", UserController, only: [:show, :create, :update, :delete] do
      resources "/orders", OrderController, only: [:index, :show, :create, :update, :delete]
    end
  end
end
