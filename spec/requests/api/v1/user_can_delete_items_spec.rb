require "rails_helper"

describe "Deleting Items" do
  it "returns a status 204 JSON response if the record is successfully deleted" do
    item = Item.create(name: "Item 1 Name", description: "Item 1 Description", image_url: "image1.jpg")
    expect(Item.all.count).to eq(1)
    delete "/api/v1/items/#{item.id}"
    expect(response).to have_http_status(:no_content)
    expect(Item.all.count).to eq(0)
  end

  it "returns a status 404 JSON response if the record is not successfully deleted" do
    item = Item.create(name: "Item 1 Name", description: "Item 1 Description", image_url: "image1.jpg")
    expect(Item.all.count).to eq(1)
    delete "/api/v1/items/#{item.id + 1}"
    expect(response).to have_http_status(:not_found)
    expect(Item.all.count).to eq(1)
  end
end
