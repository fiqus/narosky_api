defmodule NaroskyApiWeb.SpecieView do
  use NaroskyApiWeb, :view
  alias NaroskyApiWeb.SpecieView

  def render("index.json", %{species: species}) do
    %{species: render_many(species, SpecieView, "specie.json")}
  end

  def render("quiz_options.json", %{quiz_options: quiz_options}) do
    %{quiz_options: render_many(quiz_options, SpecieView, "quiz_option.json")}
  end

  def render("specie.json", %{specie: specie}) do
    %{
      id: specie.id,
      name_es: specie.name_es,
      name_en: specie.name_en,
      name_pt: specie.name_pt,
      sci_name: specie.sci_name,
      picture: specie.picture,
      regions: specie.regions,
      status: specie.status,
      difficulty: specie.difficulty
    }
  end

  def render("quiz_option.json", %{specie: quiz_option}) do
    %{
      correct: render_one(quiz_option.correct, SpecieView, "specie.json"),
      incorrects: render_many(quiz_option.incorrects, SpecieView, "specie.json")
    }
  end
end
