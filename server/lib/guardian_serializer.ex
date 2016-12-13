defmodule Odin.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Ecto.UUID
  alias Odin.{Repo, User}

  def for_token(user = %User{}), do: { :ok, "User:#{UUID.dump(user.id)}" }
  def for_token(_), do: { :error, "Unknown resource type" }

  def from_token("User:" <> id), do: { :ok, Repo.get(User, UUID.cast(id)) }
  def from_token(_), do: { :error, "Unknown resource type" }
end
