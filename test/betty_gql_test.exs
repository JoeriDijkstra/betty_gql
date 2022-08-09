defmodule BettyGqlTest do
  use ExUnit.Case
  doctest BettyGql

  test "[login_functions] extract jwt token" do
    response = %Neuron.Response{
      body: %{
        "data" => %{
          "login" => %{
            "jwtToken" => "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhcHBfdXVpZCI6ImMxMDkzZTQ4MTEwZjRjZGFhNTJkYzUxZjFjNmNjNjIyIiwiYXVkIjoiSm9rZW4iLCJhdXRoX3Byb2ZpbGUiOiI0OTM1Nzg0MTRkYjk0NzRkYjMxNzEyNzdmYzBlOTBmMiIsImV4cCI6MTY2MDAzOTc1MSwiaWF0IjoxNjYwMDMyNTUxLCJpc3MiOiJKb2tlbiIsImp0aSI6IjJzNHB0anFybzRkZWhjZjBqNDAxbXJuNSIsImxvY2FsZSI6bnVsbCwibmJmIjoxNjYwMDMyNTUxLCJyb2xlcyI6W10sInVzZXJfaWQiOjd9.8zN83IxMQmCCiLDsTnKGYceJg37whjNuMapx3BOMHrbeoe7ZBcNyNkIokHd1apuT-QgH_SFDplAsTIxeGa4koA"
          }
        }
      },
      headers: [
        {"Date", "Tue, 09 Aug 2022 08:09:11 GMT"},
        {"Content-Type", "application/json; charset=utf-8"},
        {"Transfer-Encoding", "chunked"},
        {"Connection", "keep-alive"},
        {"Vary", "Accept-Encoding"},
        {"bb-request-id", "xJ9VNhwzSXLgcdfFw3YavQ=="},
        {"cache-control", "max-age=0, private, must-revalidate"},
        {"x-request-id", "38af989f367270ee446daf8a5b9bd1b3"},
        {"Strict-Transport-Security", "max-age=63072000; includeSubDomains"}
      ],
      status_code: 200
    }

    assert BettyGql.Functions.LoginFunctions.extract_jwt_token(response) == "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhcHBfdXVpZCI6ImMxMDkzZTQ4MTEwZjRjZGFhNTJkYzUxZjFjNmNjNjIyIiwiYXVkIjoiSm9rZW4iLCJhdXRoX3Byb2ZpbGUiOiI0OTM1Nzg0MTRkYjk0NzRkYjMxNzEyNzdmYzBlOTBmMiIsImV4cCI6MTY2MDAzOTc1MSwiaWF0IjoxNjYwMDMyNTUxLCJpc3MiOiJKb2tlbiIsImp0aSI6IjJzNHB0anFybzRkZWhjZjBqNDAxbXJuNSIsImxvY2FsZSI6bnVsbCwibmJmIjoxNjYwMDMyNTUxLCJyb2xlcyI6W10sInVzZXJfaWQiOjd9.8zN83IxMQmCCiLDsTnKGYceJg37whjNuMapx3BOMHrbeoe7ZBcNyNkIokHd1apuT-QgH_SFDplAsTIxeGa4koA"
  end

  test "[login_functions] get login variables" do
    Application.put_env(:betty_gql, :app_identifier, "test-app")
    Application.put_env(:betty_gql, :app_uuid, "some_uuid")
    Application.put_env(:betty_gql, :authentication_profile_uuid, "auth_uuid")
    Application.put_env(:betty_gql, :username, "username")
    Application.put_env(:betty_gql, :password, "password")

    assert BettyGql.Functions.LoginFunctions.get_login_variables() == {"https://test-app.betty.app/api/runtime/some_uuid", %{"password" => "password", "username" => "username", "auth_profile" => "auth_uuid"}}
  end
end
