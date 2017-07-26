require './app/services/store_service'

class Store
  attr_reader :name, :description, :city, :distance, :phone, :store_type

  def initialize(store_params)
    @name = store_params[:longName]
    @description = store_params[:description]
    @city = store_params[:city]
    @distance = store_params[:distance]
    @phone = store_params[:phone]
    @store_type = store_params[:storeType]
  end

  def self.all_near(location)
    StoreService.get_all_near(location).map do |store_params|
      new(store_params)
    end
  end
end
