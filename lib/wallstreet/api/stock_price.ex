defmodule Wallstreet.Api.StockPrice do
  @moduledoc """
  Defines the API for retreiving market and stock data
  """
  @url "https://api.iextrading.com/1.0/stock/{SYMBOL}/quote"
  def quote(stock) do
   uri = String.replace(@url, "{SYMBOL}", stock)
    case HTTPoison.get(uri) do
      {:ok, %{status_code: 200, body: body}} -> Poison.decode(body)
      {:ok, %{status_code: 404}} -> "Not found"# 404 Not Found Error
      {:error, %HTTPoison.Error{reason: reason}} -> IO.inspect reason
    end
  end
end
