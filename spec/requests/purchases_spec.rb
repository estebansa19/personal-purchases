require 'rails_helper'

RSpec.describe 'Purchases', type: :request do
  let(:payload) { JSON.parse(response.body) }

  xdescribe '#index' do
    context 'when there are one or more records' do
      #let!(:purchase) { create(:purchase) }
      let(:expected_response) { [purchase.as_json] }

      it 'returns a JSON with the purchases' do
        get api_v1_purchases_path

        expect(payload).to eq(expected_response)
      end
    end

    context 'when there are no records' do
      let(:expected_response) { [] }

      it 'returns an empty array' do
        get api_v1_purchases_path

        expect(payload).to eq(expected_response)
      end
    end
  end

  xdescribe '#create' do
    let(:params) do
      { purchase: { title: 'example title', value: 1000 } }
    end

    it 'creates the purchase' do
      post api_v1_purchases_path, params: params

      expect(payload['title']).to eq('example title')
      expect(payload['value']).to eq(1000)
    end
  end
end
