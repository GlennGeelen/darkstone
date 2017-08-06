defmodule Darkstone.Character do
  use Darkstone.Web, :model

  schema "characters" do
    field :name, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required ([:name])
  end
end
