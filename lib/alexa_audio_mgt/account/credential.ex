defmodule AlexaAudioMgt.Account.Credential do
  use Ecto.Schema
  import Ecto.Changeset

  alias AlexaAudioMgt.Account.User

  schema "credentials" do
    field :password, :string, size: 100
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:password, :user_id])
    |> validate_required([:password, :user_id])
  end
end
