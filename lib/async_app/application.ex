defmodule AsyncApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AsyncApp.Repo,
      # Start the Telemetry supervisor
      AsyncAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AsyncApp.PubSub},
      # Start the Endpoint (http/https)
      AsyncAppWeb.Endpoint,
      # Start a worker by calling: AsyncApp.Worker.start_link(arg)
      # {AsyncApp.Worker, arg}

      #Scheduler
      AsyncApp.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AsyncApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AsyncAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
