defmodule Odin.User do
  use Odin.Web, :model

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :is_active, :boolean, default: false
    field :is_admin, :boolean, default: false
    field :hashed_password, :string

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @required_fields [:email, :first_name, :last_name, :password, :password_confirmation]
  @optional_fieds [:email, :first_name, :last_name, :password, :password_confirmation]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :first_name, :last_name, :is_active, :is_admin, :password, :password_confirmation])
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
  end

  defp hash_password(%{valid?: false} = changeset), do: changeset
  defp hash_password(%{valid?: true} = changeset) do
      hashedpw = Comeonin.Bcrypt.hashpwsalt(Ecto.Changeset.get_field(changeset, :password))
      Ecto.Changeset.put_change(changeset, :hashed_password, hashedpw)
  end
end
