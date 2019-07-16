defmodule NaroskyApiWeb.Schema.Query.SpeciesTest do
  use NaroskyApiWeb.ConnCase, async: true
  alias NaroskyApi.Species.Specie
  alias NaroskyApi.Repo

  setup do
    %Specie{
      name_es: "Hornero",
      name_en: "",
      name_pt: "Joao de Barro",
      sci_name: "furnarius rufus",
      active: true
    }
    |> Repo.insert!()

    :ok
  end

  @query """
  {
    species {
      name_es
    }
  }
  """
  test "species field returns the data" do
    conn = build_conn()
    conn = get conn, "/api", query: @query

    assert json_response(conn, 200) == %{
             "data" => %{
               "species" => [
                 %{"name_es" => "Hornero"}
               ]
             }
           }
  end

  @query """
  {
    species(matching: "hor") {
      name_es
    }
  }
  """
  test "species field returns species filtered by name_es" do
    response = get(build_conn(), "/api", query: @query)

    assert json_response(response, 200) == %{
             "data" => %{
               "species" => [
                 %{"name_es" => "Hornero"}
               ]
             }
           }
  end

  @query """
  {
    species(matching: 123) {
      name_es
    }
  }
  """
  test "species field returns errors when using a bad value" do
    response = get(build_conn(), "/api", query: @query)

    assert %{
             "errors" => [
               %{"message" => message}
             ]
           } = json_response(response, 400)

    assert message == "Argument \"matching\" has invalid value 123."
  end

  @query """
  query ($term: String) {
    species(matching: $term) {
      name_es
    }
  }
  """
  @variables %{"term" => "horn"}
  test "species field filters by name_es when using a variable" do
    response = get(build_conn(), "/api", query: @query, variables: @variables)

    assert json_response(response, 200) == %{
             "data" => %{
               "species" => [
                 %{"name_es" => "Hornero"}
               ]
             }
           }
  end
end
