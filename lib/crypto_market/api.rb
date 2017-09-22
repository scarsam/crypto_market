# Why did this work: https://api.cryptonator.com/api/currencies
# But not this: https://www.cryptonator.com/api/currencies
class CryptoMarket::API

  def self.currencies_list
    url = 'https://api.cryptonator.com/api/currencies'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def self.coin_info(coin)
    url = "https://api.cryptonator.com/api/ticker/#{coin}-usd"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

end
