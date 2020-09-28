defmodule AlexaAudioMgt.Audio.Media do
  use Ecto.Schema
  import Ecto.Changeset

  schema "media" do
    field :link, :string, size:  255
    field :mp3_link, :string, size: 255
    belongs_to :user, AlexaAudioMgt.Account.User

    timestamps()
  end

  @doc false
  def changeset(media, attrs) do
    media
    |> cast(attrs, [:link, :mp3_link])
    |> validate_required([:link, :mp3_link])
  end
end
