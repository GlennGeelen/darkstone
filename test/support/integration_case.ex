defmodule Darkstone.IntegrationCase do

  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias Darkstone.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import DarkstoneWeb.Router.Helpers
      import Darkstone.TestHelpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Darkstone.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Darkstone.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Darkstone.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
