defmodule AlexaAudioMgt.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, size: 30
      add :email, :string

      timestamps()
    end

    create unique_index(:users, [:username])

  end
end
