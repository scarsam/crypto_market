# Why did this work: https://api.cryptonator.com/api/currencies
# But not this: https://www.cryptonator.com/api/currencies
class CryptoMarket::Db

  def self.currencies_list
    url = 'https://api.cryptonator.com/api/currencies'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def self.coin_info(code_name)
    url = "https://api.cryptonator.com/api/ticker/#{code_name}-usd"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response).flatten.drop(1)[0] unless JSON.parse(response)['success'] == false
  end

end
