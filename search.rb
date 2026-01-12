class CoinSearch
  def initialize(coins)
    @coins = coins
  end

  # Find a coin by full or partial name or symbol
  def find_coin(input)
    input_down = input.downcase
    @coins.find do |coin|
      coin["name"].downcase.include?(input_down) || coin["symbol"].downcase == input_down
    end
  end
end
