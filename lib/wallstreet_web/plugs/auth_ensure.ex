defmodule Wallstreet.Plug.EnsureAuthentication do

  use Guardian.Plug.Pipeline,
    otp_app: :wallstreet,
    module: Wallstreet.Auth.Guardian

  plug Guardian.Plug.EnsureAuthenticated

end
