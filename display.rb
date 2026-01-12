class Display
  def self.show_coin(coin)
    return unless coin

    puts "-" * 50
    puts "#{coin['name']} (#{coin['symbol']})"
    puts "Price USD: $#{coin['price_usd']}"
    puts "Change 1h: #{coin['percent_change_1h']}%"
    puts "Change 24h: #{coin['percent_change_24h']}%"
    puts "Change 7d: #{coin['percent_change_7d']}%"
    puts "Market Cap: $#{coin['market_cap_usd']}"
    puts "24h Volume: $#{coin['volume24']}"
    puts "Circulating Supply: #{coin['csupply']}"
    puts "-" * 50
  end
end