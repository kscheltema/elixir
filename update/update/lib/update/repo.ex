defmodule Update.Repo do
  use Ecto.Repo,
    otp_app: :update,
    adapter: Ecto.Adapters.Postgres
end
