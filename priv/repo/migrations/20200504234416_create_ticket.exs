defmodule Helpix.Repo.Migrations.CreateTicket do
  use Ecto.Migration

  def change do
    create table(:ticket) do
      add :user_id, :integer
      add :subject, :string
      add :body, :string
      add :status, :integer
      add :department_id, :integer
      add :last_replier, :string

      timestamps()
    end

  end
end
