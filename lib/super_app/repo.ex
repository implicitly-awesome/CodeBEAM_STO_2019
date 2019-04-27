defmodule SuperApp.Repo do
  use Ecto.Repo,
    otp_app: :super_app,
    adapter: Ecto.Adapters.Postgres
end
