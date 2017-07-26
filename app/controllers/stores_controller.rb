class StoresController < ApplicationController
  def search
  end

  def index
    connection = Faraday.new(url: "https://api.bestbuy.com/v1/stores(postalCode=#{params[:postal_code]})?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV['BEST_BUY_API_KEY']}")
    response = connection.get
    raw_stores = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
