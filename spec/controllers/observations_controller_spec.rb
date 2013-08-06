require 'spec_helper'

describe ObservationsController do

  describe "POST 'create'" do
      it "creates an observation object when sent a post request" do
          post :create, :observation => {
              :observation_number => 10101
          }
          expect(assigns[:observation]).to_not be_new_record
          expect(response).to redirect_to(assigns[:observation])
      end
  end

  describe "POST 'create' with a complete dataset" do
      it "creates a colleciton of observations, measurements and a night" do
          n_measurements = Measurement.all.length
          n_nights = Night.all.length
          post :create, :observation => {
              :observation_number => 10101,
              :measurements_attributes => [
                  {
                      :mjd => 20392.521
                  },
                  {
                      :mjd => 2019.212
                  }
              ],
              :night_attributes => {
                  :start_date => 2.days.ago,
                  :end_date => 1.days.ago
              }
          }
          expect(assigns[:observation]).to_not be_new_record
          expect(Measurement.all.length).to eq(n_measurements + 2)
          expect(Night.all.length).to eq(n_nights + 1)
      end
  end

end
