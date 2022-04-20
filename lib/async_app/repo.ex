defmodule AsyncApp.Repo do
  use Ecto.Repo,
    otp_app: :async_app,
    adapter: Ecto.Adapters.Postgres
end
