class Api::V1::ItemsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item, status: :created
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      render json: {}, status: :no_content
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end
