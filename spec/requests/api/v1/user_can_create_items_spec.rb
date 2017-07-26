require "rails_helper"

describe "Creating items" do
  it "returns a 201 JSON response containing the item attributes if the item is successfully created" do
    post "/api/v1/items?item[name]=ItemName&item[description]=ItemDescription&item[image_url]=image.png"
    expect(Item.all.count).to eq(1)
    expect(response).to have_http_status(:created)

    item = JSON.parse(response.body, symbolize_names: true)
    expect(item).to be_a Hash
    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item[:name]).to eq("ItemName")
    expect(item).to have_key(:description)
    expect(item[:description]).to eq("ItemDescription")
    expect(item).to have_key(:image_url)
    expect(item[:image_url]).to eq("image.png")
    expect(item).not_to have_key(:created_at)
    expect(item).not_to have_key(:updated_at)
  end
end
