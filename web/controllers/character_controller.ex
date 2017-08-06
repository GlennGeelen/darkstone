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
      {:ok, post} ->
        conn
        |> put_flash(:info, "Character created")
        |> redirect(to: character_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end
end
