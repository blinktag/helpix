defmodule Helpix.Users do
  alias Helpix.{Repo, Users.User}

  @type t :: %User{}

  @spec create_admin(map()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def create_admin(params) do
    %User{}
    |> User.changeset(params)
    |> User.changeset_role(%{role: "admin"})
    |> Repo.insert()
  end

  @spec set_admin_role(t()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def set_admin_role(user) do
    user
    |> User.changeset_role(%{role: "admin"})
    |> Repo.update()
  end

  @spec is_admin?(any) :: boolean
  def is_admin?(%{role: "admin"}), do: true
  def is_admin?(_), do: false
end
