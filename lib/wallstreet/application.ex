defmodule Wallstreet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      WallstreetWeb.Telemetry,
      # Start the Ecto repository
      Wallstreet.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Wallstreet.PubSub},
      # Start Finch
      {Finch, name: Wallstreet.Finch},
      # Start the Endpoint (http/https)
      WallstreetWeb.Endpoint,
      Wallstreet.Healthcheck.Supervisor
      # Start a worker by calling: Wallstreet.Worker.start_link(arg)
      # {Wallstreet.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wallstreet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WallstreetWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
