defmodule Wallstreet.Api.StockPrice do
  @moduledoc """
  Defines the API for retreiving market and stock data
  """
  alias Wallstreet.Api.Server
  def batch_quote(%{"stocks" => portfolio_params}) do
    {:ok, pid} = Server.start_link()
    portfolio_params
    |> Enum.each(fn stock ->
      Server.get_price(pid, stock)
    end)

    Server.get_state(pid)
    end
  end




# https://api.iextrading.com/1.0/stock/market/batch?symbols=aapl,fb&types=price
