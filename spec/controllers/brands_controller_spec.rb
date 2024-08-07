require 'rails_helper'

RSpec.describe BrandsController, type: :controller do # rubocop:disable Metrics/BlockLength
  describe 'GET #index' do
    it 'renders the serialized brands as JSON' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    let(:brand) { Brand.create(name: 'Tesla') }

    it 'renders the serialized brand as JSON' do
      get :show, params: { id: brand.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'creates a new brand' do
      post :create, params: { brand: { name: 'Tesla' } }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PATCH #update' do
    let(:brand) { Brand.create(name: 'Tesla') }

    it 'updates the brand' do
      patch :update, params: { id: brand.id, brand: { name: 'BMW' } }
      expect(response).to have_http_status(:ok)
      brand.reload
      expect(brand.name).to eq('BMW')
    end
  end

  describe 'DELETE #destroy' do
    let(:brand) { Brand.create(name: 'Brand') }

    it 'destroys the brand' do
      delete :destroy, params: { id: brand.id }
      expect(response).to have_http_status(:no_content)
      expect(Brand.find_by(id: brand.id)).to be_nil
    end
  end
end
