defmodule Wallstreet.Api.StockPrice do
  @moduledoc """
  Defines the API for retreiving market and stock data
  """
  alias Wallstreet.Api.Server
  @url "https://api.iextrading.com/1.0/stock/{SYMBOL}/quote"
## portfolio params
  # %{
  #   "initial_investment" => "10000.00",
  #   "stocks" => ["MSFT", "AAPL", "TSLA", "BRKb", "JPC"]
  # }
  def batch_quote(%{"stocks" => portfolio_params}) do
    {:ok, pid} = Server.start_link()
    portfolio_params
    |> Enum.each(fn stock ->
      Server.get_price(pid, stock)
    end)

    Server.get_state(pid)
    # %{
    #   "AAPL" => 174.62,
    #   "BA" => 316.36,
    #   "GS" => 194.34,
    #   "KSS" => 65.67,
    #   "TSLA" => 346
    # }
    end
  end




# https://api.iextrading.com/1.0/stock/market/batch?symbols=aapl,fb&types=price
# def temperatures_of(cities) do
#   coordinator_pid = spawn(Metex.Coordinator, :loop, [[], Enum.count(cities)])

#   cities |> Enum.each(fn city ->
#     worker_pid = spawn(Metex.Worker, :loop, [])
#     send worker_pid, {coordinator_pid, city}
#   end)
# end
