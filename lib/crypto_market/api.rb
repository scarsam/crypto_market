# Why did this work: https://api.cryptonator.com/api/currencies
# But not this: https://www.cryptonator.com/api/currencies
class CryptoMarket::Api

  def self.fetch_coin_data
    url = URI('https://coinmarketcap-nexuist.rhcloud.com/api/all')
    response = Net::HTTP.get(url)
    JSON.parse(response)
  end

  def self.validate_coin_data
    fetch_coin_data.select do |coin_name, coin_attributes|
      coin_attributes.all? do |attribute, attribute_value|
        !attribute_value.nil? || !attribute_value == '?'
      end
    end
  end

end
