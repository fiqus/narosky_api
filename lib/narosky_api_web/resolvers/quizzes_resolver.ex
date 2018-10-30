defmodule NaroskyApiWeb.QuizzesResolver do
  import Ecto.Query, only: [from: 2]
  alias NaroskyApi.Repo
  alias NaroskyApi.Species.Specie

  def quiz(_root, args, _info) do
    query = from s in Specie, order_by: fragment("RANDOM()"), limit: 10
    species = Repo.all(query)
    {:ok, %{options: species}}
  end
end
