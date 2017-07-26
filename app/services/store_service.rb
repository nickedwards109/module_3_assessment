class StoreService
  def self.get_all_near(location)
    connection = Faraday.new(url: "https://api.bestbuy.com/v1/stores(area(#{location},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=100&apiKey=#{ENV['BEST_BUY_API_KEY']}")
    response = connection.get
    raw_stores = JSON.parse(response.body, symbolize_names: true)
    raw_stores[:stores]
  end
end
