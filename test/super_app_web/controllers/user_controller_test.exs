defmodule SuperAppWeb.UserControllerTest do
  use SuperAppWeb.ConnCase, async: false

  import Ecto.Changeset

  alias Plug.Conn
  alias SuperApp.{Repo, User}

  setup do
    {:ok, user} =
      %User{}
      |> cast(%{name: "test1", email: "test1@test.com"}, ~w(name email)a)
      |> Repo.insert(returning: true)

    {:ok, conn: build_conn(), user: user}
  end

  describe "show/2" do
    test "returns an existing user", %{conn: conn, user: user} do
      user_json = Jason.encode!(user)

      assert %Conn{resp_body: ^user_json, status: 200} = get(conn, "/users/#{user.id}")
    end

    test "returns an error for nonexistent user", %{conn: conn} do
      assert %Conn{status: 404} = get(conn, "/users/0")
    end
  end

  describe "create/2" do
    test "creates a user", %{conn: conn} do
      params = %{
        name: "my super app user",
        email: "my@test.com"
      }

      assert %Conn{resp_body: resp_body, status: 200} = post(conn, "/users", params)

      resp_map = Jason.decode!(resp_body)
      assert resp_map["name"] == params.name
      assert resp_map["email"] == params.email
    end

    test "returns an error for malformed params", %{conn: conn} do
      params = %{
        name: "my super app user",
        email: "invalid_email"
      }

      assert %Conn{status: 422} = post(conn, "/users", params)
    end
  end

  describe "update/2" do
    test "updates a user", %{conn: conn, user: user} do
      params = %{
        name: "my super app user"
      }

      assert user.name != params.name
      assert %Conn{resp_body: resp_body, status: 200} = put(conn, "/users/#{user.id}", params)

      resp_map = Jason.decode!(resp_body)
      assert resp_map["id"] == user.id
      assert resp_map["name"] == params.name
      assert resp_map["email"] == user.email
    end

    test "returns an error for malformed params", %{conn: conn, user: user} do
      params = %{
        name: 123
      }

      assert %Conn{status: 422} = put(conn, "/users/#{user.id}", params)
    end
  end

  describe "delete/2" do
    test "deletes an existing user", %{conn: conn, user: user} do
      assert %Conn{resp_body: "\"deleted\"", status: 200} = delete(conn, "/users/#{user.id}")
    end

    test "returns an error for nonexistent user", %{conn: conn} do
      assert %Conn{status: 422} = delete(conn, "/users/777")
    end
  end
end
