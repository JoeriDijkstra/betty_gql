defmodule BettyGql do

  alias BettyGql.Functions.LoginFunctions
  alias BettyGql.Queries.LoginQueries

  def initialize do
    {app_url, credentials} = LoginFunctions.get_login_variables()
    Neuron.Config.set(url: app_url)

    case Neuron.query(LoginQueries.login_query(credentials)) do
      {:ok, resp} -> {:ok, LoginFunctions.extract_jwt_token(resp)}
      {:error, message} -> {:error, message}
    end
  end

  def make_request(jwt, query) do
    {jwt, query}
  end
end
