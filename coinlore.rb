require_relative "api"
require_relative "search"
require_relative "display"
require "tty-prompt"

prompt = TTY::Prompt.new
author = "Snofall"

puts "Welcome to Coin Lore CLI by #{author}"

# Step 1: Fetch top coins once to build search index
puts "Fetching Top 100 Crypto-Currencies..."
coins = ApiClient.fetch_top_coins
searcher = CoinSearch.new(coins)

# Step 2: Interactive loop for user input
loop do
  input = prompt.ask("Enter a currency name or ticker symbol(or 'exit' to quit):")
  break if input.nil? || input.downcase == "exit"

  coin_info = searcher.find_coin(input)

  if coin_info
    full_coin = ApiClient.fetch_coin_by_id(coin_info["id"])
    Display.show_coin(full_coin)
  else
    puts "Currency not found. Try again!"
  end
end

puts "goodbye!"
