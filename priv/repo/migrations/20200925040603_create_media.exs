defmodule AlexaAudioMgt.Repo.Migrations.CreateMedia do
  use Ecto.Migration

  def change do
    create table(:media) do
      add :link, :string
      add :mp3_link, :string
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:media, [:user_id])
  end
end
