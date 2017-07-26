require 'will_paginate/array'

class StoresController < ApplicationController
  def search
  end

  def index
    search_location = params[:postal_code]
    stores = Store.all_near(search_location)
    @stores_count = stores.count
    @stores = stores.paginate(page: params[:page], per_page: 10)
  end
end
