defmodule Darkstone.Character do
  use Darkstone.Web, :model

  schema "characters" do
    belongs_to :user, Darkstone.User
    field :name, :string
    field :characterClass, :string
    field :agility, :integer
    field :strength, :integer
    field :cunning, :integer
    field :spirit, :integer
    field :lore, :integer
    field :luck, :integer
    field :initiative, :integer
    field :rangeToHit, :integer
    field :meleeToHit, :integer
    field :combat, :integer
    field :maxGrit, :integer
    field :actualGrid, :integer
    field :health, :integer
    field :sanity, :integer
    field :defense, :integer
    field :armor, :integer
    field :spiritArmor, :integer
    field :bonusDamage, :integer
    field :willpower, :integer
    field :gold, :integer
    field :level, :integer
    field :experience, :integer
    field :darkstone, :integer
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params,
      [
      :name,
      :characterClass,
      :agility,
      :strength,
      :cunning,
      :spirit,
      :lore,
      :luck,
      :initiative,
      :rangeToHit,
      :meleeToHit,
      :combat,
      :maxGrit,
      :actualGrid,
      :health,
      :sanity,
      :defense,
      :armor,
      :spiritArmor,
      :bonusDamage,
      :willpower,
      :gold,
      :level,
      :experience,
      :darkstone
        ])
    |> validate_required([:name, :characterClass])
  end

  def initialize("Preacher", character) do
    %{
      "agility" => 1,
      "strength" => 3,
      "cunning" => 2,
      "spirit" => 4,
      "lore" => 3,
      "luck" => 2,
      "initiative" => 2,
      "rangeToHit" => 4,
      "meleeToHit" => 4,
      "combat" => 2,
      "maxGrit" => 2,
      "actualGrid" => 0,
      "health" => 12,
      "sanity" => 10,
      "defense" => 5,
      "armor" => 0,
      "spiritArmor" => 0,
      "bonusDamage" => 0,
      "willpower" => 3,
      "gold" => 0,
      "level" => 1,
      "experience" => 0,
      "darkstone" => 0
    }
    |> Map.merge(character)
  end

  def initialize("Indian Scout", character) do
    %{
      "agility" => 3,
      "strength" => 2,
      "cunning" => 3,
      "spirit" => 3,
      "lore" => 3,
      "luck" => 2,
      "initiative" => 5,
      "rangeToHit" => 4,
      "meleeToHit" => 4,
      "combat" => 2,
      "maxGrit" => 2,
      "actualGrid" => 0,
      "health" => 10,
      "sanity" => 10,
      "defense" => 4,
      "armor" => 0,
      "spiritArmor" => 0,
      "bonusDamage" => 0,
      "willpower" => 4,
      "gold" => 0,
      "level" => 1,
      "experience" => 0,
      "darkstone" => 0
    }
    |> Map.merge(character)
  end

  def initialize("Rancher", character) do
    %{
      "agility" => 2,
      "strength" => 3,
      "cunning" => 2,
      "spirit" => 3,
      "lore" => 4,
      "luck" => 1,
      "initiative" => 3,
      "rangeToHit" => 4,
      "meleeToHit" => 4,
      "combat" => 2,
      "maxGrit" => 2,
      "actualGrid" => 0,
      "health" => 14,
      "sanity" => 10,
      "defense" => 4,
      "armor" => 0,
      "spiritArmor" => 0,
      "bonusDamage" => 0,
      "willpower" => 4,
      "gold" => 0,
      "level" => 1,
      "experience" => 0,
      "darkstone" => 0
    }
    |> Map.merge(character)
  end

  def initialize("Lawman", character) do
    %{
      "agility" => 2,
      "strength" => 3,
      "cunning" => 4,
      "spirit" => 1,
      "lore" => 2,
      "luck" => 3,
      "initiative" => 4,
      "rangeToHit" => 4,
      "meleeToHit" => 4,
      "combat" => 2,
      "maxGrit" => 2,
      "actualGrid" => 0,
      "health" => 12,
      "sanity" => 12,
      "defense" => 4,
      "armor" => 0,
      "spiritArmor" => 0,
      "bonusDamage" => 1,
      "willpower" => 4,
      "gold" => 0,
      "level" => 1,
      "experience" => 0,
      "darkstone" => 0
    }
    |> Map.merge(character)
  end
end
