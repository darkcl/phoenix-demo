# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tooter,
  ecto_repos: [Tooter.Repo]

# Configures the endpoint
config :tooter, TooterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Y6qD3Tc/476eEZy5yk94SoGXNYq6O4aO3mQTfbPQsUHyQ5353quLCfoezcEeAo+M",
  render_errors: [view: TooterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Tooter.PubSub,
  live_view: [signing_salt: "8XTOlYef"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
