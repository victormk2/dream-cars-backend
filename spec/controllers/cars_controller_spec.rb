require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  describe 'GET #show' do
    let(:car) { Car.create(model: 'Tesla', year: 2021) } # Assuming you have a Car factory set up

    it 'renders the serialized car as JSON' do
      get :show, params: { id: car.id }
      expect(response).to have_http_status(:ok)
    end
  end
  describe 'POST #create' do
    it 'creates a new car' do
      expect do
        post :create, params: { car: { model: 'Tesla', year: 2022 } }
      end.to change(Car, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PATCH #update' do
    let(:car) { Car.create(model: 'Tesla', year: 2021) }

    it 'updates the car' do
      patch :update, params: { id: car.id, car: { year: 2022 } }
      expect(response).to have_http_status(:ok)
      car.reload
      expect(car.year).to eq(2022)
    end
  end

  describe 'DELETE #destroy' do
    let!(:car) { Car.create(model: 'Tesla', year: 2021) }

    it 'destroys the car' do
      expect do
        delete :destroy, params: { id: car.id }
      end.to change(Car, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
