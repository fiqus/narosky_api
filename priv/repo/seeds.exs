# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     NaroskyApi.Repo.insert!(%NaroskyApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias NaroskyApi.Species.Specie
alias NaroskyApi.Repo

%Specie{name_es: "Hornero", name_en: "", name_pt: "", sci_name: "Furnarius rufus", regions: ["centro", "norte"], difficulty: 5, status: "LC", active: true} |> Repo.insert!
%Specie{name_es: "Macá Grande", name_en: "", name_pt: "", sci_name: "", regions: ["all"], difficulty: 5, status: "LC", active: true} |> Repo.insert!
%Specie{name_es: "Remolinera Araucana", name_en: "", name_pt: "", sci_name: "Furnarius rufus", regions: ["sur"], difficulty: 3, status: "LC", active: true} |> Repo.insert!
%Specie{name_es: "Tachurí Siete Colores", name_en: "", name_pt: "", sci_name: "Furnarius rufus", regions: ["alle"], difficulty: 4, status: "LC", active: true} |> Repo.insert!
