require 'rails_helper'

RSpec.describe CarsController, type: :controller do # rubocop:disable Metrics/BlockLength
  describe 'GET #index' do
    it 'renders the serialized cars as JSON' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    let(:brand) { Brand.create(name: 'Tesla') }
    let(:car) { Car.create(model: 'Tesla', year: 2021, brand:) }

    it 'renders the serialized car as JSON' do
      get :show, params: { id: car.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'creates a new car' do
      post :create, params: { car: { model: 'Tesla', year: 2022, brand_id: Brand.create(name: 'Tesla').id } }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PATCH #update' do
    let(:brand) { Brand.create(name: 'Tesla') }
    let(:car) { Car.create(model: 'Tesla', year: 2021, brand:) }

    it 'updates the car' do
      patch :update, params: { id: car.id, car: { year: 2022 } }
      expect(response).to have_http_status(:ok)
      car.reload
      expect(car.year).to eq(2022)
    end
  end

  describe 'DELETE #destroy' do
    let(:brand) { Brand.create(name: 'Brand') }
    let(:car) { Car.create(model: 'Tesla', year: 2021, brand:) }

    it 'destroys the car' do
      delete :destroy, params: { id: car.id }
      expect(response).to have_http_status(:no_content)
      expect(Car.find_by(id: car.id)).to be_nil
    end
  end
end
