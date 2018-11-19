defmodule Wallstreet.Plug.Authentication do

  use Guardian.Plug.Pipeline,
    otp_app: :wallstreet,
    error_handler: Wallstreet.GuardianErrorHandler,
    module: Wallstreet.Auth.Guardian

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.LoadResource, allow_blank: true

end
