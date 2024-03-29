defmodule NaroskyApiWeb.SessionController do
  use NaroskyApiWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    with {:ok, user} <- NaroskyApi.Auth.authenticate_user(email, password),
         {:ok, conn} <- NaroskyApi.Auth.login(conn, user) do
      conn
      |> put_flash(:info, "Welcome back!")
      |> redirect(to: Routes.specie_path(conn, :index))
    else
      _ ->
        conn
        |> put_flash(:error, "Invalid email/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> NaroskyApi.Auth.logout()
    |> redirect(to: Routes.session_path(conn, :new))
  end
end
