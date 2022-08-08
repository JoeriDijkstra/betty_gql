defmodule BettyGql.Functions.LoginFunctions do
  # Public Functions
  def get_login_variables do
    {build_app_url(), get_credentials()}
  end

  def extract_jwt_token(response) do
    Map.get(response, :body)["data"]["login"]["jwtToken"]
  end

  # Private Functions
  defp get_credentials do
    username = Application.fetch_env!(:betty_gql, :username)
    password = Application.fetch_env!(:betty_gql, :password)
    auth_profile = Application.fetch_env!(:betty_gql, :authentication_profile_uuid)
    %{"username" => username, "password" => password, "auth_profile" => auth_profile}
  end

  defp build_app_url do
      app_identifier = Application.fetch_env!(:betty_gql, :app_identifier)
      app_uuid = Application.fetch_env!(:betty_gql, :app_uuid)
      "https://#{app_identifier}.betty.app/api/runtime/#{app_uuid}"
  end
end
