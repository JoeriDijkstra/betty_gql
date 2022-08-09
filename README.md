# BettyGql

## Description
Wrapper of the data api of your Betty Blocks application. A sample config/config.exs would like this:
```elixir
import Config

config :betty_gql, :app_uuid, "The UUID of the application"
config :betty_gql, :authentication_profile_uuid, "The authentication profile uuid where the user is connected to"
config :betty_gql, :username, "Your username"
config :betty_gql, :password, "Your users password"
config :betty_gql, :app_identifier, "Your app identifier"
```

More information can be found on the Betty Blocks documentation: https://docs.bettyblocks.com/en/collections/166288-data-model#data-api

## Disclaimer
This is an unofficial package that has been created by me, but has not been endorsed by Betty Blocks in any way.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `betty_gql` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:betty_gql, "~> 0.1.0"}
  ]
end
```

## Documentation
Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/betty_gql>.

