defmodule Wallstreet.Repo do
  use Ecto.Repo,
    otp_app: :wallstreet,
    adapter: Ecto.Adapters.Postgres
end
