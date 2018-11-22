defmodule Wallstreet.Plug.EnsureAuthentication do
  @moduledoc false
  use Guardian.Plug.Pipeline,
    otp_app: :wallstreet,
    module: Wallstreet.Auth.Guardian

  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource)

end
