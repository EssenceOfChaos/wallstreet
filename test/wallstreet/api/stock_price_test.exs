defmodule Wallstreet.StockPriceTest do
  @moduledoc """
  Defines the test suite for the WallStreet API
  """
  use ExUnit.Case

  test "starts the GenServer" do
   {:ok, pid} =  Wallstreet.Api.Server.start_link()
   assert is_pid(pid) == true
  end
end
