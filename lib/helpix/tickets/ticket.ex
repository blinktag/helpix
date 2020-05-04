defmodule Helpix.Tickets.Ticket do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ticket" do
    field :body, :string
    field :department_id, :integer
    field :last_replier, :string
    field :status, :integer
    field :subject, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(ticket, attrs) do
    ticket
    |> cast(attrs, [:user_id, :subject, :body, :status, :department_id, :last_replier])
    |> validate_required([:user_id, :subject, :body, :status, :department_id, :last_replier])
  end
end
