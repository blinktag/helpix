defmodule Helpix.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :user_id, references(:users)
      add :body, :string

      timestamps()
    end
  end
end
