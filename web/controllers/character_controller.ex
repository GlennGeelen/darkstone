defmodule Darkstone.CharacterController do
  use Darkstone.Web, :controller

  alias Darkstone.Character
  alias Darkstone.Characters

  def index(conn, _params) do
    render(conn, "index.html", characters: Characters.list_characters)
  end

  def new(conn, _params) do
    render(conn, "new.html", changeset: Character.changeset(%Character{}, %{}))
  end

  def create(conn, %{"character" => character}) do
    case Characters.create_character(character) do
      {:ok, _character} ->
        conn
        |> put_flash(:info, "Character created")
        |> redirect(to: character_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => character_id}) do
    changeset =
      Characters.get_character!(character_id)
      |> Character.changeset

    render conn, "edit.html", changeset: changeset
  end

  def update(conn, %{"id" => character_id, "character" => character}) do
    Characters.get_character!(character_id)
    |> Characters.update_character(character)
    |> case do
      {:ok, _character } ->
        conn
        |> put_flash(:info, "Character updated")
        |> redirect(to: character_path(conn, :index))
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset
    end
  end

  def delete(conn, %{"id" => character_id}) do
    Characters.get_character!(character_id)
    |> Characters.delete_character()
    conn
    |> put_flash(:info, "Character deleted")
    |> redirect(to: character_path(conn, :index))
  end

  def details(conn, %{"id" => character_id}) do
    character = Characters.get_character!(character_id)

    render conn, "details.html", character: character
  end
end
