defmodule AlexaAudioMgt.Repo do
  use Ecto.Repo,
    otp_app: :alexa_audio_mgt,
    adapter: Ecto.Adapters.Postgres
end
