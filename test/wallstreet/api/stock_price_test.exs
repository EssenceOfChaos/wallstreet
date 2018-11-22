defmodule Wallstreet.StockPriceTest do
  use ExUnit.Case

  test "returns a value" do
    assert Wallstreet.Api.StockPrice.quote("aapl") !== nil
  end
end
