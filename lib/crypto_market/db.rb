# Why did this work: https://api.cryptonator.com/api/currencies
# But not this: https://www.cryptonator.com/api/currencies
class CryptoMarket::Db

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

  # Returns all of the names from the nested hash
  def self.find_names
    currencies_list.flat_map do |key, value|
      value.flatten.map { |coin| coin['name'] }
    end
  end

end
