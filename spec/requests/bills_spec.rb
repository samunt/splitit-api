# spec/requests/bills_spec.rb
require 'rails_helper'

RSpec.describe 'Splitit API', type: :request do
  # initialize test data
  let!(:bill) { create_list(:bill, 10) }
  let(:bill_id) { bill.first.id }

  # Test suite for GET /bills
  describe 'GET /bills' do
    # make HTTP get request before each example
    before { get '/bills' }

    it 'returns bills' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /bills/:id
  describe 'GET /bills/:id' do
    before { get "/bills/#{bill_id}" }

    context 'when the record exists' do
      it 'returns the bill' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(bill_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:bill_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Bill/)
      end
    end
  end

  # Test suite for POST /bills
  describe 'POST /bills' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/bills', params: valid_attributes }

      it 'creates a bill' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/bills', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /bills/:id
  describe 'PUT /bills/:id' do
    let(:valid_attributes) { { title: '90234902' } }

    context 'when the record exists' do
      before { put "/bills/#{bill_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /bills/:id
  describe 'DELETE /bills/:id' do
    before { delete "/bills/#{bill_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
