class Api::V1::ItemsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      render json: {}, status: :no_content
    end
  end
end
