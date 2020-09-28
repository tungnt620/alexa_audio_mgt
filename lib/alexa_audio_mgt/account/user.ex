defmodule AlexaAudioMgt.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias AlexaAudioMgt.Account.Credential

  schema "users" do
    field :email, :string, size: 255
    field :username, :string, size: 30
    has_one :credential, Credential

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    IO.inspect(attrs)
    user
    |> cast(attrs, [:username, :email])
    |> IO.inspect
    |> validate_required([:username, :email])
    |> IO.inspect
    |> validate_format(:email, ~r/\S+@\S+\.\S+/, message: "Email incorrect format")
  end
end
