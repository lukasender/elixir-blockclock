defmodule BlockClock.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BlockClockWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BlockClock.PubSub},
      # Start the Endpoint (http/https)
      BlockClockWeb.Endpoint,
      BlockClock.Store.Supervisor,
      {BlockClock.Workers.Supervisor, workers_config()}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BlockClock.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BlockClockWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  def workers_config() do
    Application.get_env(:block_clock, BlockClock.Workers)
  end
end
