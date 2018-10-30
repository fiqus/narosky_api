defmodule NaroskyApi.Auth.AuthAccessPipeline do
  @moduledoc false

  use Guardian.Plug.Pipeline,
    otp_app: :narosky_api,
    module: NaroskyApi.Auth.Guardian,
    error_handler: NaroskyApi.Auth.AuthErrorHandler

  plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource)
  plug(NaroskyApi.Auth.Plug.CurrentUser)
end
