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

  def create(conn, %{"character" => name}) do
    changeset = Character.changeset(%Character{}, name)

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
end
