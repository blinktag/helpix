defmodule Helpix.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    field :role, :string, default: "user"
    pow_user_fields()

    has_many :ticket, Helpix.Tickets.Ticket

    timestamps()
  end

  def changeset_role(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_inclusion(:role, ~w(user admin))
  end
end
