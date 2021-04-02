use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :block_clock, BlockClockWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :block_clock, BlockClock.Workers,
  start_workers: false
