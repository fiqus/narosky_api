defmodule NaroskyApiWeb.Schema do
  use Absinthe.Schema

  alias NaroskyApiWeb.{SpeciesResolver, QuizzesResolver}

  object :specie do
    field :id, non_null(:id)
    field :name_es, non_null(:string)
    field :sci_name, non_null(:string)
  end

  object :quiz do
    field :options, list_of(:specie)
  end

  query do
    field :species, non_null(list_of(non_null(:specie))) do
      arg(:matching, :string)
      resolve(&SpeciesResolver.all_species/3)
    end

    field :quiz, :quiz do
      arg(:matching, :string)
      resolve(&QuizzesResolver.quiz/3)
    end
  end
end
