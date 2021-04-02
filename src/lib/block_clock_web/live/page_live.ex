defmodule BlockClockWeb.PageLive do
  use BlockClockWeb, :live_view
  use Timex

  alias BlockClock.Store

  @impl true
  def mount(_params, _session, socket) do
    # As soon as the client it connected, we try to connect with the LiveView
    # socket and subscribe to our Store.
    # After we've subscribed, we'll be notified about updates in our data
    # store.
    if connected?(socket) do
      Store.subscribe()
    end

    # Fetch data from the store (if there are any already)
    data = Store.get()

    {:ok, assign(socket, data: data)}
  end

  @doc"""
  Accept new data from our Store subscription.
  """
  @impl true
  def handle_info({:data_updated, data}, socket) do
    {:noreply, assign(socket, data: data)}
  end

  def number_to_spans(nil), do: ""
  def number_to_spans(number) do
    spans =
      Integer.to_string(number)
      |> String.split("")
      |> Enum.filter(fn x -> x != "" end)
      |> Enum.map(fn number_str -> ~E"<span><%= number_str %></span>" end)
    ~E"""
      <%= spans %>
    """
  end

  def last_updated(value) do
    Timex.format!(value, "%H:%M:%S %Z", :strftime)
  end

end
