# BlockClock

## General

Phoenix project, bootstrapped with the following command:

```sh
cd elixir-blockclock
mix phx.new src --module BlockClock --app block_clock --live --no-ecto
```

- We use LiveView
- We don't use any external datastore (hence, Ecto was not included)
- A GenServer periodically fetches data from an external API
  ([`https://mempool.space/`](https://mempool.space/api)).
- PubSub to notify a LiveView process about new data.

## Setup

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
