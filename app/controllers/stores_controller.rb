class StoresController < ApplicationController
  def search
  end

  def index
    connection = Faraday.new(url: "https://api.bestbuy.com/v1/stores(area(#{params[:postal_code]},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=100&apiKey=#{ENV['BEST_BUY_API_KEY']}")
    response = connection.get
    raw_stores = JSON.parse(response.body, symbolize_names: true)
    @stores = raw_stores[:stores]
  end
end
