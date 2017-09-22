class CryptoMarket::CLI

  def run
    greeting
    navigation
  end

  def greeting
    puts 'Hello and welcome to the Crypto Market'
    puts 'Here you can check current prices on the crypto-currency market'
    puts 'All the prices are updated every 30 seconds'
  end

  def navigation
    loop do
      puts "Use number 1-5 to navigate"
      puts ""
      input = gets.strip
      case input
        when '1'
          crypto_currencies_list
        when 'exit'
          break
        else
          call
      end
    end
  end

  def crypto_currencies_list
    puts "1. BTC - $3800"
    puts "2. ETH - $300"
    puts "3. LTC - $50"
    puts "4. XMP - $20"
    puts "5. MDP - $15"
  end

end