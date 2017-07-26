require 'rails_helper'

describe 'Getting items' do
  it 'returns a status 200 JSON response containing all items' do
    get '/api/v1/items'
    expect(response).to have_http_status(:ok)

    raw_items = JSON.parse(response.body)
    item = raw_items.first

    expect(raw_items).to be_an Array
    expect(item).to be_a Hash
    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:image_url)
    expect(item).not_to have_key(:created_at)
    expect(item).not_to have_key(:updated_at)
  end
end
