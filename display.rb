class Display
  def self.show_coin(coin)
    return unless coin

    puts "-" * 50
    puts "#{coin['name']} (#{coin['symbol']})".yellow.bold
    puts "Price USD: $#{coin['price_usd']}".green.bold
    change_1h = coin['percent_change_1h'].to_f
    puts "Change 1h: #{change_1h}%".send(change_1h >= 0 ? :green : :red).bold
    change_24h = coin['percent_change_24h'].to_f
    puts "Change 24h: #{change_24h}%".send(change_24h >= 0 ? :green : :red).bold
    change_7d = coin['percent_change_7d'].to_f
    puts "Change 7d: #{change_7d}%".send(change_7d >= 0 ? :green : :red).bold
    puts "Market Cap: $#{coin['market_cap_usd']}".cyan.bold
    puts "24h Volume: $#{coin['volume24']}".cyan.bold
    puts "Circulating Supply: #{coin['csupply']}".magenta.bold
    puts "-" * 50
  end
end