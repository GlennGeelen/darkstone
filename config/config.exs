# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :darkstone,
  ecto_repos: [Darkstone.Repo]

# Configures the endpoint
config :darkstone, DarkstoneWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+qQrWWCoFi44cAFcIYdDY46Xn1p2/eO3LOVHnn8Ifq7kZlYId7pWKla5gCI7etkY",
  render_errors: [view: DarkstoneWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Darkstone.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: DarkstoneWeb.User,
  repo: Darkstone.Repo,
  module: Darkstone,
  router: DarkstoneWeb.Router,
  messages_backend: DarkstoneWeb.Coherence.Messages,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :registerable]

config :coherence, DarkstoneWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
