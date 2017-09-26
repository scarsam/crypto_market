# Why did this work: https://api.cryptonator.com/api/currencies
# But not this: https://www.cryptonator.com/api/currencies
class CryptoMarket::Db

  def self.currencies_list
    url = 'https://coinmarketcap-nexuist.rhcloud.com/api/all'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

end
