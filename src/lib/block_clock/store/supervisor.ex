defmodule BlockClock.Store.Supervisor do

  @doc"""
  The Supervisor which keeps track of our `Store` GenServer.
  """

  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl true
  def init(:ok) do
    children = [
      BlockClock.Store
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
