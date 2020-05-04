# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :helpix,
  ecto_repos: [Helpix.Repo]

# Configures the endpoint
config :helpix, HelpixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DBhGMbITMsTLfHywI9jd+46JrSjmttIJr/e2SmwAL/QhzbQAl2GLHlj/Hx4isw1+",
  render_errors: [view: HelpixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Helpix.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :helpix, :pow,
  user: Helpix.Users.User,
  repo: Helpix.Repo

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
