defmodule Odin.UserTest do
  use Odin.ModelCase

  alias Odin.User

  @valid_attrs %{email: "test@test.com", first_name: "foo", last_name: "bar", password: "1lh2bj1rjbk2", password_confirmation: "1lh2bj1rjbk2"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "invalid email address" do
    changeset = User.changeset(%User{}, %{
      email: "testtest.com",
      first_name: "foo",
      password: "1lh2bj1rjbk2",
      password_confirmation: "1lh2bj1rjbk2"})
    refute changeset.valid?
  end

  test "missing first name" do
    changeset = User.changeset(%User{}, %{
      email: "test@test.com",
      last_name: "bar",
      password: "1lh2bj1rjbk2",
      password_confirmation: "1lh2bj1rjbk2"})
    refute changeset.valid?
  end

  test "missing last name" do
    changeset = User.changeset(%User{}, %{
      email: "test@test.com",
      first_name: "foo",
      password: "1lh2bj1rjbk2",
      password_confirmation: "1lh2bj1rjbk2"})
    refute changeset.valid?
  end

  test "mis-matched password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{
      email: "test@test.com",
      first_name: "foo",
      last_name: "bar",
      password: "1lh2bj1rjbk2",
      password_confirmation: "b1bk23jkn12"})
    refute changeset.valid?
  end

  test "missing password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{
      email: "test@test.com",
      first_name: "foo",
      last_name: "bar",
      password: "1lh2bj1rjbk2"})
    refute changeset.valid?
  end

  test "short password doesn't work" do
    changeset = User.changeset(%User{}, %{
      email: "test@test.com",
      first_name: "foo",
      last_name: "bar",
      password: "1lh2d",
      password_confirmation: "1lh2d"})
    refute changeset.valid?
  end
end
