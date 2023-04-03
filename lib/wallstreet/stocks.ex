defmodule Wallstreet.Stocks do
  @moduledoc """
    Stock module retrieves list of stocks from S&P500
  """
  alias NimbleCSV.RFC4180, as: CSV

  @doc """
    Reads into memory the stock data from sp500_companies.csv
  """
  @spec open_stocks :: list
  def open_stocks() do
    stocks_csv()
    |> File.stream!()
    |> CSV.parse_stream()
    |> Stream.map(fn col ->
      %{
        symbol: :binary.copy(Enum.at(col, 1)),
        name: :binary.copy(Enum.at(col, 2)),
        sector: :binary.copy(Enum.at(col, 4)),
        market_cap: :binary.copy(Enum.at(col, 7))
      }
    end)
    |> Enum.to_list()
  end

  @spec stocks_csv :: binary
  defp stocks_csv() do
    Application.app_dir(:marketwatch, "/priv/static/assets/data/sp500_companies.csv")
  end

  def mock_stocks() do
    [
      %{
        market_cap: "$2,482,288,353,920",
        name: "Apple Inc",
        sector: "Information Technology",
        symbol: "AAPL"
      },
      %{
        market_cap: "$1,928,014,206,749",
        name: "Microsoft Corp",
        sector: "Information Technology",
        symbol: "MSFT"
      },
      %{
        market_cap: "$1,324,201,940,000",
        name: "Alphabet Inc Class C",
        sector: "Communication Services",
        symbol: "GOOG"
      },
      %{
        market_cap: "$1,324,201,940,000",
        name: "Alphabet Inc Class A",
        sector: "Communication Services",
        symbol: "GOOGL"
      },
      %{
        market_cap: "$1,322,548,366,473",
        name: "Amazon.Com Inc.",
        sector: "Consumer Discretionary",
        symbol: "AMZN"
      }
    ]
  end
end
