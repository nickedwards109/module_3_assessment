require 'rails_helper'

describe 'Getting items' do
  it 'returns a status 200 JSON response containing all items' do
    Item.create(name: "Item 1 Name", description: "Item 1 Description", image_url: "image1.jpg")
    Item.create(name: "Item 2 Name", description: "Item 2 Description", image_url: "image2.jpg")
    get '/api/v1/items'
    expect(response).to have_http_status(:ok)

    raw_items = JSON.parse(response.body, symbolize_names: true)
    item = raw_items.first
    expect(raw_items).to be_an Array
    expect(item).to be_a Hash
    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item[:name]).to eq("Item 1 Name")
    expect(item).to have_key(:description)
    expect(item[:description]).to eq("Item 1 Description")
    expect(item).to have_key(:image_url)
    expect(item[:image_url]).to eq("image1.jpg")
    expect(item).not_to have_key(:created_at)
    expect(item).not_to have_key(:updated_at)
  end

  it 'returns a status 200 JSON response containing a single item' do
    item = Item.create(name: "Item 1 Name", description: "Item 1 Description", image_url: "image1.jpg")
    get "/api/v1/items/#{item.id}"
    expect(response).to have_http_status(:ok)

    item = JSON.parse(response.body, symbolize_names: true)
    expect(item).to be_a Hash
    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item[:name]).to eq("Item 1 Name")
    expect(item).to have_key(:description)
    expect(item[:description]).to eq("Item 1 Description")
    expect(item).to have_key(:image_url)
    expect(item[:image_url]).to eq("image1.jpg")
    expect(item).not_to have_key(:created_at)
    expect(item).not_to have_key(:updated_at)
  end
end
