defmodule Odin.SessionControllerTest do
  use Odin.ConnCase

  alias Odin.Session
  @valid_attrs %{"grant_type": "password", "email": "test@test.com", "password": "12345678"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "allows users to login", %{conn: conn} do
    conn = post conn, session_path(conn, :create), @valid_attrs
    assert json_response(conn, 200)["data"] == []
  end

  test "allows users to login", %{conn: conn} do
    conn = get conn, session_path(conn, :create)
    assert json_response(conn, 200)["data"] == []
  end
end
