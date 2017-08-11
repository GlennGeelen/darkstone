defmodule Darkstone.Repo.Migrations.AddCharacter do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string
      add :characterClass, :string
      add :agility, :integer
      add :strength, :integer
      add :cunning, :integer
      add :spirit, :integer
      add :lore, :integer
      add :luck, :integer
      add :initiatve, :integer
      add :rangeToHit, :integer
      add :meleeToHit, :integer
      add :combat, :integer
      add :maxGrit, :integer
      add :actualGrid, :integer
      add :health, :integer
      add :sanity, :integer
      add :defense, :integer
      add :armor, :integer
      add :spiritArmor, :integer
      add :bonusDamage, :integer
      add :willPower, :integer
      add :gold, :integer
      add :level, :integer
      add :experience, :integer
      add :darkstone, :integer
    end
  end
end
