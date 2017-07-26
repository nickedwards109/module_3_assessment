class StoresController < ApplicationController
  def search
  end

  def index
    search_location = params[:postal_code]
    @stores = Store.all_near(search_location)
  end
end
