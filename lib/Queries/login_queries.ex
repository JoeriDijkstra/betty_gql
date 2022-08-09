defmodule BettyGql.Queries.LoginQueries do
  @moduledoc """
  This module stores the reusable queries needed to perform basic actions
  """

  @doc """
  Query needed to login, parsed to use the credentials map
  """
  def login_query(credentials) do
    """
      mutation login {
        login(
          authProfileUuid: "#{credentials["auth_profile"]}",
          username: "#{credentials["username"]}",
          password: "#{credentials["password"]}"
        ) {
          jwtToken
        }
      }
    """
  end
end
