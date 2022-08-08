defmodule BettyGql.Queries.LoginQueries do
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
