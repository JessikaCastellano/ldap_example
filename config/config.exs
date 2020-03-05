# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :ldap_example, LdapExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Cd0ty99gNw47GlR3wLceToAoVH7NDwc//2t0K5dwj3jYc8iKcvAqmNqN2YIWDasB",
  render_errors: [view: LdapExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LdapExample.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :exldap, :settings,
  server: "193.147.239.148",
  base: "DC=UEM,DC=ES",
  port: 389,
  ssl: false,
  user_dn: "ou=ALUMNOS,dc=ALUMNOS,dc=UEM,dc=ES",
  search_timeout: 5_000

config :paddle, Paddle,
  host: "193.147.239.148",
  base: "OU=ALUMNOS,DC=ALUMNOS,DC=UEM,DC=ES",
  ssl: false,
  port: 389