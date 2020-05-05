defmodule Helpix.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()

    has_many :tickets, Helpix.Ticket

    timestamps()
  end
end
