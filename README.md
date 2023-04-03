# Wallstreet

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

## System Requirements

- Install Erlang `brew install erlang`
- Install Elixir `brew install elixir`
- Install Phoenix
  - Install Hex package manager: `mix local.hex`
  - Install Phoenix `mix archive.install hex phx_new`
- Install Postgres `brew install postgresql`

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

Example Create User

```elixir
Accounts.create_user(%{email: "crazyeddie23@google.com", favorites: ["option3", "option4"], portfolio: %{aapl: 167.10, msft: 235.50, tsla: 321, ibm: 190.25}, name: "Eddie Van Relano"})
```

April 1, 2023
