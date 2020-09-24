# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :alexa_audio_mgt,
  ecto_repos: [AlexaAudioMgt.Repo]

# Configures the endpoint
config :alexa_audio_mgt, AlexaAudioMgtWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SmUUs5SpYk5lHrDCvVj/Zee7PrMdNaykTcjLi655jeVJcXt4nkuX0oNalHOtGVgI",
  render_errors: [view: AlexaAudioMgtWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AlexaAudioMgt.PubSub,
  live_view: [signing_salt: "rFrc5ytH"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
