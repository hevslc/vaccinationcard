defmodule Vaccinationcard.Repo do
  use Ecto.Repo,
    otp_app: :vaccinationcard,
    adapter: Ecto.Adapters.Postgres
end
