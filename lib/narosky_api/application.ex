defmodule NaroskyApi.Application do
  @moduledoc false
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      NaroskyApi.Repo,
      # Start the endpoint when the application starts
      NaroskyApiWeb.Endpoint
      # Starts a worker by calling: NaroskyApiWeb.Worker.start_link(arg)
      # {NaroskyApiWeb.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NaroskyApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    NaroskyApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
