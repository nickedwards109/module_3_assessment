class Store
  attr_reader :name, :description, :city, :distance, :store_type
  
  def initialize(store_params)
    @name = store_params[:name]
    @description = store_params[:description]
    @city = store_params[:city]
    @distance = store_params[:distance]
    @store_type = store_params[:store_type]
  end

  def self.all_near(location)
    StoreService.get_all_near(location).map do |store_params|
      new(store_params)
    end
  end
end
