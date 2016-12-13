defmodule Odin.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :is_active, :boolean, default: true, null: false
      add :is_admin, :boolean, default: false, null: false
      add :hashed_password, :string

      timestamps()
    end
    create unique_index(:users, [:email])

  end
end
