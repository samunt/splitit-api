# spec/requests/items_spec.rb
require 'rails_helper'

RSpec.describe 'Items API' do
  let(:user) { create(:user) }
  let!(:bill) { create(:bill, created_by: user.id) }
  let!(:items) { create_list(:item, 20, bill_id: bill.id) }
  let(:bill_id) { bill.id }
  let(:id) { items.first.id }
  let(:headers) { valid_headers }

  describe 'GET /bills/:bill_id/items' do
    before { get "/bills/#{bill_id}/items", params: {}, headers: headers }

    # [...]
  end

  describe 'GET /bills/:bill_id/items/:id' do
    before { get "/bills/#{bill_id}/items/#{id}", params: {}, headers: headers }

    # [...]
  end

  describe 'POST /bills/:bill_id/items' do
    let(:valid_attributes) { { name: 'Visit Narnia', done: false }.to_json }

    context 'when request attributes are valid' do
      before do
        post "/bills/#{bill_id}/items", params: valid_attributes, headers: headers
      end

      # [...]
    end

    context 'when an invalid request' do
      before { post "/bills/#{bill_id}/items", params: {}, headers: headers }

      # [...]
    end
  end

  describe 'PUT /bills/:bill_id/items/:id' do
    let(:valid_attributes) { { name: 'Mozart' }.to_json }

    before do
      put "/bills/#{bill_id}/items/#{id}", params: valid_attributes, headers: headers
    end

    # [...]
    # [...]
  end

  describe 'DELETE /bills/:id' do
    before { delete "/bills/#{bill_id}/items/#{id}", params: {}, headers: headers }

    # [...]
  end
end
