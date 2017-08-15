defmodule Darkstone.Character do
  use Darkstone.Web, :model

  schema "characters" do
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
end
