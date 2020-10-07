defmodule Tooter.Repo do
  use Ecto.Repo,
    otp_app: :tooter,
    adapter: Ecto.Adapters.Postgres
end
