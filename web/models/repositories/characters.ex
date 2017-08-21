defmodule Darkstone.Characters do

  alias Darkstone.Repo
  alias Darkstone.Character

  def create_character(character) do
    initializedCharacter =
      character["characterClass"]
      |> Character.initialize(character)
    Character.changeset(%Character{}, initializedCharacter)
    |> Repo.insert()
  end

  def list_characters do
    Repo.all(Character)
  end

  def get_character!(id) do
    Repo.get!(Character, id)
  end

  def update_character(%Character{} = old_character, attrs) do
    old_character
    |> Character.changeset(attrs)
    |> Repo.update()
  end

  def delete_character(%Character{} = character) do
    Repo.delete(character)
  end
end
