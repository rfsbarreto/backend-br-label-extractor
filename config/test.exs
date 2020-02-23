use Mix.Config

# Configure your database
config :backend_vagas, BackendVagas.Repo,
  database: 'backend_vagas_dev',
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

if System.get_env("GITHUB_ACTIONS") do
  config :backend_vagas, BackendVagas.Repo,
    username: 'postgres',
    password: 'postgres'
end

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :backend_vagas, BackendVagasWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
