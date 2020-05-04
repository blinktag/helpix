defmodule Helpix.Repo do
  use Ecto.Repo,
    otp_app: :helpix,
    adapter: Ecto.Adapters.Postgres
end
