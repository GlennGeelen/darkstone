defmodule Darkstone.Repo.Migrations.AddCharacter do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string
    end
  end
end
