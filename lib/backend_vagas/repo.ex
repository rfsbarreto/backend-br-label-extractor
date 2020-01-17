defmodule BackendVagas.Repo do
  use Ecto.Repo,
    otp_app: :backend_vagas,
    adapter: Ecto.Adapters.Postgres
end
