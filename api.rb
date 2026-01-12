require "httparty"
require "json"

class ApiClient
  BASE_URL = "https://api.coinlore.net/api"

  # Fetch info for a single coin by its CoinLore ID
  def self.fetch_coin_by_id(coin_id)
    url = "#{BASE_URL}/ticker/?id=#{coin_id}"
    response = HTTParty.get(url)

    if response.code == 200
      JSON.parse(response.body).first
    else
      puts "Error fetching coin! Status code: #{response.code}"
      nil
    end
  rescue JSON::ParserError
    puts "Error: Could not parse response as JSON."
    nil
  end

  # Fetch top 100 coins to build search index
  def self.fetch_top_coins
    url = "#{BASE_URL}/tickers/"
    response = HTTParty.get(url)

    if response.code == 200
      JSON.parse(response.body)["data"]
    else
      puts "Error fetching top coins! Status code: #{response.code}"
      []
    end
  rescue JSON::ParserError
    puts "Error: Could not parse top coins JSON."
    []
  end
end
