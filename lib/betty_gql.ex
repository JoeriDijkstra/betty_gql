defmodule BettyGql do

  alias BettyGql.Functions.LoginFunctions
  alias BettyGql.Queries.{LoginQueries, DataQueries}

  @moduledoc """
  This module was made as a wrapper for the data api used in Betty Blocks. This package aims to allow you to make a graphql request using a singular function.

  This way it is easier to make microservices controlling your data and/or actions
  """

  @doc """
  Authenticates the user and returns a JWT token. This token can be used in the make_request function.

  The authentication is based on the config/config.exs file A more detailed explanation can be found here: https://github.com/JoeriDijkstra/betty_gql
  """
  def login do
    {app_url, credentials} = LoginFunctions.get_login_variables()
    Neuron.Config.set(url: app_url)

    case Neuron.query(LoginQueries.login_query(credentials)) do
      {:ok, resp} -> {:ok, LoginFunctions.authenticate(resp)}
      {:error, message} -> {:error, message}
    end
  end

  @doc """
  Executes a GraphQL query which can be provided, using the JWT token that is provided. Will return the full result as a Neuron map
  """
  def execute_query(query) do
    {app_url, _} = LoginFunctions.get_login_variables()
    Neuron.Config.set(url: app_url)
    {:ok, result} = Neuron.query(query)
    Map.get(result, :body)
  end

  def all(type, fields, where \\ "") do
    query = DataQueries.all_query(type, fields, where)
    IO.inspect(query)
    execute_query(query)
  end

  def one(type, fields, where \\ "") do
    query = DataQueries.one_query(type, fields, where)
    IO.inspect(query)
    execute_query(query)
  end
end
