
# app/requests/billeds_spec.rb
require 'rails_helper'

RSpec.describe 'billeds API' do
  # Initialize the test data
  let!(:bil) { create(:bill) }
  let!(:billeds) { create_list(:billed, 20, bill_id: bill.id) }
  let(:bill_id) { bill.id }
  let(:id) { billeds.first.id }

  # Test suite for GET /bills/:bill_id/billeds
  describe 'GET /bills/:bill_id/billeds' do
    before { get "/bills/#{bill_id}/billeds" }

    context 'when bill exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all bill billeds' do
        expect(json.size).to eq(20)
      end
    end

    context 'when bill does not exist' do
      let(:bill_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Bill/)
      end
    end
  end

  # Test suite for GET /bills/:bill_id/billeds/:id
  describe 'GET /bills/:bill_id/billeds/:id' do
    before { get "/bills/#{bill_id}/billeds/#{id}" }

    context 'when bill billed exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the billed' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when bill billed does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Billed/)
      end
    end
  end

  # Test suite for PUT /bills/:bill_id/billeds
  describe 'POST /bills/:bill_id/billeds' do
    let(:valid_attributes) { { name: 'Visit Narnia', done: false } }

    context 'when request attributes are valid' do
      before { post "/bills/#{bill_id}/billeds", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/bills/#{bill_id}/billeds", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /bills/:bill_id/billeds/:id
  describe 'PUT /bills/:bill_id/billeds/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/bills/#{bill_id}/billeds/#{id}", params: valid_attributes }

    context 'when billed exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the billed' do
        updated_billed = billed.find(id)
        expect(updated_billed.name).to match(/Mozart/)
      end
    end

    context 'when the billed does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Billed/)
      end
    end
  end

  # Test suite for DELETE /bills/:id
  describe 'DELETE /bills/:id' do
    before { delete "/bills/#{bill_id}/billeds/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
