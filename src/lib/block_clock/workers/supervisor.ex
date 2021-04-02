defmodule BlockClock.Workers.Supervisor do

  @doc"""
  The Supervisor which keeps track of our `DataWorker` GenServer.
  """

  use Supervisor

  alias BlockClock.Workers.DataWorker

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(opts) do
    case Keyword.get(opts, :start_workers, true) do
      # Do not start any children if workers should not be started
      false -> :ignore
      _ ->
        children = [
          # Pepare the worker specs
          {DataWorker, Keyword.get(opts, :data_worker)}
        ]

        Supervisor.init(children, strategy: :one_for_one)
    end
  end
end
