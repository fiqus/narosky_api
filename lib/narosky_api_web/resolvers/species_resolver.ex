defmodule NaroskyApiWeb.SpeciesResolver do
  alias NaroskyApi.Species

  def all_species(_root, args, _info) do
    {:ok, Species.list_species(args)}
  end
end
