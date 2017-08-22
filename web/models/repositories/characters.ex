defmodule Darkstone.Characters do

  alias Darkstone.Repo
  alias Darkstone.Character
  import Ecto

  def create_character(conn, character) do
    initializedCharacter =
    case character["characterClass"] do
      "" -> character
      _ ->  character["characterClass"]
            |> Character.initialize(character)
    end

    Coherence.current_user(conn)
    |> build_assoc(:characters)
    |> Character.changeset(initializedCharacter)
    |> Repo.insert()
  end

  def list_characters(user) do
    Repo.all Ecto.assoc(user, :characters)
  end

  def get_character(id, user) do
    Repo.get(Ecto.assoc(user, :characters), id)
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
