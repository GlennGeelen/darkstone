defmodule Darkstone.CharacterController do
  use Darkstone.Web, :controller

  alias Darkstone.Character

  def index(conn, _params) do
    characters = Repo.all(Character)

    render(conn, "index.html", characters: characters)
  end

  def new(conn, _params) do
    changeset = Character.changeset(%Character{}, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"character" => character}) do
    initializedCharacter = initializeCharacter(character["characterClass"], character)
    changeset = Character.changeset(%Character{}, initializedCharacter)

    case Repo.insert(changeset) do
      {:ok, _character} ->
        conn
        |> put_flash(:info, "Character created")
        |> redirect(to: character_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => character_id}) do
    character = Repo.get(Character, character_id)
    changeset = Character.changeset(character)

    render conn, "edit.html", changeset: changeset, character: character
  end

  def update(conn, %{"id" => character_id, "character" => name}) do
    old_character = Repo.get(Character, character_id)
    changeset = Character.changeset(old_character, name)

    case Repo.update(changeset) do
      {:ok, _character } ->
        conn
        |> put_flash(:info, "Character updated")
        |> redirect(to: character_path(conn, :index))
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset, character: old_character
    end
  end

  def delete(conn, %{"id" => character_id}) do
    Repo.get!(Character, character_id) |> Repo.delete!

    conn
    |> put_flash(:info, "Character deleted")
    |> redirect(to: character_path(conn, :index))
  end

  def details(conn, %{"id" => character_id}) do
    character = Repo.get(Character, character_id)
    render conn, "details.html", character: character
  end

  def initializeCharacter("preacher", character) do
    %{
      "agility" => 1,
      "strength" => 3,
      "cunning" => 2,
      "spirit" => 1,
      "lore" => 1,
      "luck" => 1,
      "initiatve" => 1,
      "rangeToHit" => 1,
      "meleeToHit" => 1,
      "combat" => 1,
      "maxGrit" => 1,
      "actualGrid" => 1,
      "health" => 1,
      "sanity" => 1,
      "defense" => 1,
      "armor" => 1,
      "spiritArmor" => 1,
      "bonusDamage" => 1,
      "willPower" => 1,
      "gold" => 0,
      "level" => 1,
      "experience" => 0,
      "darkstone" => 1
    }
    |> Map.merge(character)
  end

  def initializeCharacter("indianScout", character) do
    %{
      "agility" => 1,
      "strength" => 3,
      "cunning" => 2,
      "spirit" => 1,
      "lore" => 1,
      "luck" => 1,
      "initiatve" => 1,
      "rangeToHit" => 1,
      "meleeToHit" => 1,
      "combat" => 1,
      "maxGrit" => 1,
      "actualGrid" => 1,
      "health" => 1,
      "sanity" => 1,
      "defense" => 1,
      "armor" => 1,
      "spiritArmor" => 1,
      "bonusDamage" => 1,
      "willPower" => 1,
      "gold" => 0,
      "level" => 1,
      "experience" => 0,
      "darkstone" => 1
    }
    |> Map.merge(character)
  end
  def initializeCharacter("rancher", character) do
    %{
      "agility" => 1,
      "strength" => 3,
      "cunning" => 2,
      "spirit" => 1,
      "lore" => 1,
      "luck" => 1,
      "initiatve" => 1,
      "rangeToHit" => 1,
      "meleeToHit" => 1,
      "combat" => 1,
      "maxGrit" => 1,
      "actualGrid" => 1,
      "health" => 1,
      "sanity" => 1,
      "defense" => 1,
      "armor" => 1,
      "spiritArmor" => 1,
      "bonusDamage" => 1,
      "willPower" => 1,
      "gold" => 0,
      "level" => 1,
      "experience" => 0,
      "darkstone" => 1
    }
    |> Map.merge(character)
  end
  def initializeCharacter("lawman", character) do
    %{
      "agility" => 1,
      "strength" => 3,
      "cunning" => 2,
      "spirit" => 1,
      "lore" => 1,
      "luck" => 1,
      "initiatve" => 1,
      "rangeToHit" => 1,
      "meleeToHit" => 1,
      "combat" => 1,
      "maxGrit" => 1,
      "actualGrid" => 1,
      "health" => 1,
      "sanity" => 1,
      "defense" => 1,
      "armor" => 1,
      "spiritArmor" => 1,
      "bonusDamage" => 1,
      "willPower" => 1,
      "gold" => 0,
      "level" => 1,
      "experience" => 0,
      "darkstone" => 1
    }
    |> Map.merge(character)
  end

  def initializeCharacter("", character) do
    character
  end

end
